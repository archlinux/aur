# Contributor: Patrick Mischke

pkgname='python-pyjson5'
_name='pyjson5'
pkgver=1.6.9
pkgrel=1
pkgdesc="A JSON5 serializer and parser library for Python 3 written in Cython."
url="https://github.com/Kijewski/pyjson5"
depends=('cython' 'python-more-itertools')
makedepends=('python-build' 'python-colorama' 'python-docutils' 'python-setuptools' 'python-sphinx' 'python-sphinx-autodoc-typehints' 'python-sphinx_rtd_theme' 'python-wheel')
license=('Apache-2.0' 'MIT')
arch=('any')
source=("https://github.com/Kijewski/pyjson5/archive/refs/tags/v$pkgver.tar.gz" "https://github.com/lemire/fast_double_parser/archive/refs/tags/v0.8.0.tar.gz")
sha256sums=('bc9e7095a4a4c2b49bf0ce42aef32f4206458edfa6c9947bc5720cb2142fe50a' '9ad74e059cc7c3e53a3057ca97a74c88ae2a6a7d36ce470193557cbd05ee8f92')

build() {
  cp -r -T fast_double_parser-0.8.0 "$_name-$pkgver/third-party/fast_double_parser"
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
