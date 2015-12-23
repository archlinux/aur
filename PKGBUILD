# Maintainer: Maurizio D'Addona <mauritiusdadd@gmail.com>

pkgname="bcwc_pcie-git"
pkgver=r189.6a12079
pkgrel=1
pkgdesc="Reverse engineered Linux driver for the Broadcom 1570 PCIe webcam"
url="https://github.com/patjak/bcwc_pcie"
depends=('kmod')
optdepends=()
makedepends=('linux>=4.2' 'linux<4.3' 'linux-headers' 'git')
arch=('i686' 'x86_64')
license=('custom')
install="${pkgname}.install"

_extramodules="extramodules-4.2-ARCH"

source=("${pkgname}::git+https://github.com/patjak/bcwc_pcie.git")

sha256sums=('SKIP')

pkgver()
{
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
