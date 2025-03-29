# Maintainer: Arti Zirk <arti.zirk@gmail.com>
# Contributor: 1Conan <me@1conan.com>
# Contributor: hendy643 <phenderson643@gmail.com>

_target=aarch64-none-linux-gnu
pkgname=${_target}-gcc-bin
pkgver=14.2.rel1
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 Linux target"
arch=('x86_64' 'aarch64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')

# https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
source_x86_64=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}.tar.xz)
sha256sums_x86_64=('47aeefc02b0ee39f6d4d1812110952975542d365872a7474b5306924bca4faa1')
source_aarch64=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}.tar.xz)
sha256sums_aarch64=('299c56db1644c135670afabbf801b97a42e5ef6069d73157ab869458cbda2096')

options=('!strip' '!debug' '!emptydirs' 'staticlibs')
provides=(aarch64-none-linux-gnu-gcc aarch64-none-linux-gnu-gcc-binutils aarch64-none-linux-gnu-gdb)
conflicts=( 'aarch64-linux-gnu-binutils'
            'aarch64-linux-gnu-gcc'
            'aarch64-linux-gnu-gdb'
            'aarch64-linux-gnu-glibc'
            'aarch64-linux-gnu-linux-api-headers'
            'aarch64-none-linux-gnu-gcc-12.3-bin'
            'aarch64-none-linux-gnu-gcc-10.3-bin'
            'aarch64-none-linux-gnu-gcc-9.2-bin'
)

package() {
  mkdir -p ${pkgdir}/usr
  cp -a ${srcdir}/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}/* ${pkgdir}/usr

  rm -f ${pkgdir}/usr/license.txt
  rm -f ${pkgdir}/usr/*-manifest.txt
  rm -rf ${pkgdir}/usr/lib64
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/share/{doc,gcc-*,gdb,info,locale}
  rm -rf ${pkgdir}/usr/share/man/{man5,man7}
  rm -rf ${pkgdir}/usr/lib/bfd-plugins/libdep.so
}
