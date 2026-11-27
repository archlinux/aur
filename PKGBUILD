# Maintainer: crimist <aur at crim dot ist>
# Contributor: Nathan Henrie <nate@n8henrie.com>
# Contributor: Andrew Chen <andrew@xortux.com>

_target=arm-none-linux-gnueabihf
pkgname=${_target}-toolchain-bin
pkgver=15.3.rel2
pkgrel=1
pkgdesc="GNU Toolchain for the Cortex-A Family"
arch=('x86_64' 'aarch64')
url="https://gitlab.arm.com/tooling/gnu-toolchains-for-arm"
license=('GPL' 'LGPL')
depends=(binutils)
options=(!emptydirs !strip staticlibs)
_sourceurl="https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/${pkgver}"
source_x86_64=("${_sourceurl}/arm-gnu-toolchain-${pkgver}-x86_64-${_target}.tar.xz")
source_aarch64=("${_sourceurl}/arm-gnu-toolchain-${pkgver}-aarch64-${_target}.tar.xz")
sha256sums_x86_64=('3f232016d84c06b35ef02d08ef9d94e2ff1f77e04b82d665f95c6baf1b640660')
sha256sums_aarch64=('41e5b0935cc0004994982258ea974f2af2a6b6bd5d90cdf409ef567808d311a4')

package() {
  mkdir -p ${pkgdir}/usr
  cp -a "${srcdir}/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}/"* "${pkgdir}/usr"

  mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
  mv ${pkgdir}/usr/license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rm -f ${pkgdir}/usr/*-manifest.txt
  rm -rf ${pkgdir}/usr/lib64
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/share/{doc,gcc-*,gdb,info,locale}
  rm -rf ${pkgdir}/usr/share/man/{man5,man7}
  rm -rf ${pkgdir}/usr/lib/bfd-plugins/libdep.so
}
