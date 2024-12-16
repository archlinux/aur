# Maintainer: crimist <aur at crim dot ist>
# Contributor: Nathan Henrie <nate@n8henrie.com>
# Contributor: Andrew Chen <andrew@xortux.com>

_target=arm-none-linux-gnueabihf
pkgname=${_target}-toolchain-bin
pkgver=14.2.rel1
pkgrel=1
pkgdesc="GNU Toolchain for the Cortex-A Family"
arch=('x86_64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')
depends=(binutils)
options=(!emptydirs !strip staticlibs)
source=("https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-x86_64-${_target}.tar.xz")
sha256sums=('32301a5a33aab47810837cdab848a5a513ca22804d3168d3ada5833828b07912')

package() {
  mkdir -p ${pkgdir}/usr
  cp -a ${srcdir}/arm-gnu-toolchain-${pkgver}-x86_64-${_target}/* ${pkgdir}/usr

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  mv ${pkgdir}/usr/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -f ${pkgdir}/usr/*-manifest.txt
  rm -rf ${pkgdir}/usr/lib64
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/share/{doc,gcc-*,gdb,info,locale}
  rm -rf ${pkgdir}/usr/share/man/{man5,man7}
  rm -rf ${pkgdir}/usr/lib/bfd-plugins/libdep.so
}
