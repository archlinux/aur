# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=imgviz
pkgname=python-imgviz
pkgver=1.7.5
pkgrel=1
pkgdesc='Image Visualization Tools (object detection, semantic and instance segmentation)'
arch=('any')
url='https://github.com/wkentaro/imgviz'
license=('MIT')
depends=(
  python-matplotlib
  python-numpy
  python-pillow
  python-yaml
)
makedepends=(
  python-setuptools
)
checkdepends=(
  python-pytest
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/wkentaro/imgviz/archive/v${pkgver}.tar.gz")
sha512sums=('903e490b355cd5a5213f84085e9881a116f3aed5cf2a780f5b1079806958b3ece5d8513bb75528217d8990d714193406b988fac599aa89267874829c302b3fa3')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_pkgname}-${pkgver}"
  PYTHONPATH="${PWD}/build/lib" pytest -v
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
