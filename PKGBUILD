# Maintainer: hendy643 <phenderson643@gmail.com>
# Contributor: 1Conan <me@1conan.com>

_target=aarch64-none-linux-gnu
pkgname=${_target}-gcc-bin
pkgver=15.3.rel1
pkgrel=1
pkgdesc="The GNU Compiler Collection - cross compiler for ARM64 Linux target"
arch=('x86_64' 'aarch64')
url="https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads"
license=('GPL' 'LGPL')

# https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/${pkgver}/arm-gnu-toolchain-${pkgver}-x86_64-aarch64-none-linux-gnu.tar.xz
# https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/${pkgver}/arm-gnu-toolchain-${pkgver}-aarch64-aarch64-none-linux-gnu.tar.xz
source_x86_64=(https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/${pkgver}/arm-gnu-toolchain-${pkgver}-x86_64-${_target}.tar.xz)
sha256sums_x86_64=('ea12d99f87848009270277afe5d03fac873cb869784a39387183835f743014d9')
source_aarch64=(https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/${pkgver}/arm-gnu-toolchain-${pkgver}-aarch64-${_target}.tar.xz)
sha256sums_aarch64=('8020be7aa1013704756158400cb5ba438d6f09b2909795d13617b9e7bac53286')

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
