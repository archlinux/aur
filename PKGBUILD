# Contributor: Patrick Mischke

pkgname='python-pyjson5'
_name='pyjson5'
pkgver=1.6.4
pkgrel=1
pkgdesc="A JSON5 serializer and parser library for Python 3 written in Cython."
url="https://github.com/Kijewski/pyjson5"
depends=('cython' 'python-more-itertools')
makedepends=('python-build' 'python-colorama' 'python-docutils' 'python-setuptools' 'python-sphinx' 'python-sphinx-autodoc-typehints' 'python-sphinx_rtd_theme' 'python-wheel')
license=('Apache')
arch=('any')
source=("https://github.com/Kijewski/pyjson5/archive/refs/tags/v$pkgver.tar.gz" "https://github.com/lemire/fast_double_parser/archive/refs/tags/v0.7.0.tar.gz")
sha256sums=('7d853614607ee5fc6ae8a7dd5cb68644db7fb95422fd320fc8238ba7674bb1b5' 'eb80a1d9c406bbe8cb22fffd3c007651f716abd03225009302d8aba8e9c4df77')

build() {
  cp -r -T fast_double_parser-0.7.0 "$_name-$pkgver/third-party/fast_double_parser"
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
}
