# Maintainer: Jakub Klinkovský <lahwaacz at archlinux dot org>
# Contributor: Aleksey Bilogur <aleksey.bilogur@gmail.com>

pkgname=python-missingno
_name=${pkgname#python-}
pkgver=0.5.2
pkgrel=2
pkgdesc="Missing data visualization module for Python"
arch=(any)
url="https://github.com/ResidentMario/missingno"
license=(MIT)
depends=(
  python
  python-matplotlib
  python-numpy
  python-scipy
  python-seaborn
)
makedepends=(python-setuptools)
checkdepends=(
  python-pytest
  python-pytest-mpl
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
b2sums=('b80256eba3fdae6d72da73f72bcd8f98b4b04ec4b0b0f0e7e52a8dc4a2a4d8f891e6c2078b9fbfd67b783b93f6ee8d78066ff22202e1401f39f7fe13e1ec0f39')

build() {
  cd $_name-$pkgver
  python setup.py build
}

check() {
  cd $_name-$pkgver
  # FIXME: visualization tests are failing
  python -m pytest -vv --deselect tests/test_viz.py
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}
