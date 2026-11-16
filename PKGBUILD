# Contributor: Patrick Mischke

pkgname='python-pyjson5'
_name='pyjson5'
pkgver=2.0.1
pkgrel=1
pkgdesc="A JSON5 serializer and parser library for Python 3 written in Cython."
url="https://github.com/Kijewski/pyjson5"
depends=('cython' 'python-more-itertools')
makedepends=('python-build' 'python-colorama' 'python-docutils' 'python-setuptools' 'python-sphinx' 'python-sphinx-autodoc-typehints' 'python-sphinx_rtd_theme' 'python-wheel')
license=('Apache-2.0' 'MIT')
arch=('any')
source=("https://github.com/Kijewski/pyjson5/archive/refs/tags/v$pkgver.tar.gz" "https://github.com/lemire/fast_double_parser/archive/refs/tags/v0.8.1.tar.gz")
sha256sums=('3c3dd5332cb74c2f3c49d60ece3c5ac4d9779d71106a993341ca65c113784d70' '685c1b7b9383f5fcd96264467bb2efa0c9995d7e8afb66ed9c84663466c3cefd')

build() {
  cp -r -T fast_double_parser-0.8.1 "$_name-$pkgver/third-party/fast_double_parser"
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
