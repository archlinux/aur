# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=python-unet
_pkgname=unet
pkgver=0.7.9
pkgrel=2
pkgdesc='PyTorch Implementation of 2D and 3D U-Net'
arch=(any)
url='https://github.com/fepegar/unet'
license=(MIT)
depends=(
  python-pytorch
)
makedepends=(
  numactl
  python-setuptools
)
checkdepends=(
  python-pytest
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fepegar/unet/archive/v${pkgver}.tar.gz")
sha512sums=('06bd7da3d661e3a8d85436e3638118d87df3a5b0238977ac4446e61f1b6dfef0c32e99b1ac1cdeb30b02d3e0031e96f693b2879141968ff14b290940f9a2222e')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_pkgname}-${pkgver}"
  pytest -v .
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
