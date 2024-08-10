# Maintainer: leuko <aydos.de>

pkgname=xilinx-u280-gen3x16-xdma-base
_pkgver=1-3585717
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Deployment platform firmware for AMD Alveo U280"
arch=('any')
license=('custom')
url="https://docs.xilinx.com/r/en-US/ug1301-getting-started-guide-alveo-accelerator-cards"
source=(
    https://packages.xilinx.com/artifactory/debian-packages-cache/pool/${pkgname}_${_pkgver}_all.deb
)
b2sums=('a65dcf36a3e4aa285445b27d726b86fe40541402a0b8d1a31f686c94363ce54194ff12957a1375682d047c01f2f2871eb32a3c07a56dd1dc9a37fd7a5b8393d9')
package() {
  echo "Converting Debian package..."
  tar xpf data.tar.xz -C "$pkgdir"
  # Move /lib to /usr/lib, otherwise: `failed to commit transaction (conflicting files)`
  mv "$pkgdir"/lib "$pkgdir"/usr
  local p="$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/license
  install -Dm644 "$p"/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm "$p"/LICENSE
  rmdir "$p"

  # Empty file
  rm "$pkgdir"/opt/xilinx/firmware/u280/gen3x16-xdma/base/scripts/create_xsabin.log
}
