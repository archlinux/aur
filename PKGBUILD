# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

# NOTE: In order to build this package, you need the firmware for the camera
#       See the archwiki for more information on how to obtain it.

pkgname="bcwc_pcie-ck"
pkgver=r189.6a12079
pkgrel=1
pkgdesc="Reverse engineered Linux driver for the Broadcom 1570 PCIe webcam"
url="https://github.com/patjak/bcwc_pcie"
depends=('kmod')
optdepends=()
makedepends=('linux>=4.3' 'linux<4.4' 'linux-headers' 'git')
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"

_gitcommit=6a120799f1384e66bccb151a15b41c71fcca27da

source=("${pkgname}::git+https://github.com/patjak/bcwc_pcie.git#commit=${_gitcommit}")
sha256sums=('SKIP')

_extramodules="extramodules-4.3-ck"

build()
{
  cd "${srcdir}/${pkgname}"
  make ${MAKEFLAGS}

  gzip -9 "facetimehd.ko"
}

package()
{
  cd "${srcdir}/${pkgname}"
  install -dm755 "$pkgdir/usr/lib/modules/$_extramodules/"
  install -m644 'facetimehd.ko.gz' "$pkgdir/usr/lib/modules/$_extramodules/"
}
