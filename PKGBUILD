# Maintainer: howorang <howorang@gmail.com>
# Based on PKGBUILD by hendy643 <phenderson643@gmail.com>

_target=aarch64-none-elf
pkgname=${_target}-gcc-bin
pkgver=15.2.rel1
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 Bare Metal target"
arch=('x86_64' 'aarch64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')

# https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
source_x86_64=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}.tar.xz)
sha256sums_x86_64=('66f7ce7c1bf662f589a4caf440812375f3cd8000a033ccf0971127a0726d6921')
source_aarch64=(https://developer.arm.com/-/media/Files/downloads/gnu/${pkgver}/binrel/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}.tar.xz)
sha256sums_aarch64=('46195685b6aec1077e3f1b7706b43a6aa1fef4d8d3bff3a411b7dad1c5b1196b')

options=('!strip' '!debug' '!emptydirs' 'staticlibs')
provides=(aarch64-none-elf-gcc aarch64-none-elf-gcc-binutils aarch64-none-elf-gdb)
conflicts=( 'aarch64-elf-binutils'
            'aarch64-elf-gcc'
            'aarch64-elf-gdb'
            'aarch64-elf-glibc'
)

package() {
  mkdir -p ${pkgdir}/usr
  cp -a ${srcdir}/arm-gnu-toolchain-${pkgver}-${CARCH}-${_target}/* ${pkgdir}/usr

  rm -f ${pkgdir}/usr/license.txt
  rm -f ${pkgdir}/usr/*-manifest.txt
  rm -rf ${pkgdir}/usr/include
  rm -rf ${pkgdir}/usr/share/{doc,gcc-*,gdb,info,locale}
  rm -rf ${pkgdir}/usr/share/man/{man5,man7}
  rm -rf ${pkgdir}/usr/lib/bfd-plugins/libdep.so
}
