# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pyvis
_name=${pkgname#python-}
pkgver=0.3.2
pkgrel=1
pkgdesc="Python package for creating and visualizing interactive network graphs"
arch=(any)
url="https://github.com/WestHealth/pyvis"
license=(custom:BSD3)
makedepends=(python-setuptools)
checkdepends=(
  python-numpy
  python-pytest
  python-selenium
)
depends=(
  ipython
  python-jinja
  python-jsonpickle
  python-networkx
  python-pandas
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ff947e224d9825e4b0f3d6710075945c5c8d13bf60aa54e6396c996f34851a3a')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

check() {
  cd "$_archive"

  python -m pytest --ignore=pyvis/tests/test_html.py
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE_BSD.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
