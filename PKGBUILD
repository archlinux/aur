# Original Maintainer: James Duley <jagduley gmail>
# Previous Maintainer: 2bluesc <2bluesc gmail.com>
# Maintainer: Vadzim Dambrouski <pftbest gmail.com>
pkgname=gcc-arm-none-eabi-bin
pkgver=15.3.rel1
pkgrel=1
pkgdesc="GNU Tools ARM Embedded Processors (binary distribution, includes newlib, does NOT include GDB)"
arch=('aarch64' 'x86_64')
depends=('glibc')
optdepends=(
      'arm-none-eabi-gdb: GNU Debugger for ARM EABI'
    )
provides=('gcc-arm-none-eabi'
      'arm-none-eabi-gcc'
      'arm-none-eabi-binutils'
      'arm-none-eabi-newlib'
    )
conflicts=('gcc-arm-none-eabi'
      'arm-none-eabi-gcc'
      'arm-none-eabi-binutils'
      'arm-none-eabi-newlib'
    )
url='https://gitlab.arm.com/tooling/gnu-toolchains-for-arm'
source_x86_64=('https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/15.3.rel1/arm-gnu-toolchain-15.3.rel1-x86_64-arm-none-eabi.tar.xz')
source_aarch64=('https://gitlab.arm.com/api/v4/projects/tooling%2Fgnu-toolchains-for-arm/packages/generic/gnu-toolchain/15.3.rel1/arm-gnu-toolchain-15.3.rel1-aarch64-arm-none-eabi.tar.xz')
license=('custom')
options=(!strip staticlibs !debug)
sha256sums_x86_64=('563bebb2b97d53382b956d6ee1fe61e2cae26699901417234a37df505ef9b5fa')
sha256sums_aarch64=('06979e0c8171de58e5dc2a2b2019330a290f30930f27728af98a83e1a7369b3a')
package() {
  cd $srcdir/arm-*/

  mkdir -p $pkgdir/usr
  mkdir -p $pkgdir/usr/lib/gcc
  mkdir -p $pkgdir/usr/libexec/gcc
  mkdir -p $pkgdir/usr/share/doc/gcc-arm-none-eabi
  mkdir -p $pkgdir/usr/share/man

  cp -a arm-none-eabi $pkgdir/usr
  cp -a bin $pkgdir/usr
  cp -a lib/gcc/arm-none-eabi $pkgdir/usr/lib/gcc
  cp -a libexec/gcc/arm-none-eabi $pkgdir/usr/libexec/gcc
  cp -a share/* $pkgdir/usr/share/doc/gcc-arm-none-eabi
  cp -a share/man/man1 $pkgdir/usr/share/man

  rm -f $pkgdir/usr/bin/arm-none-eabi-gdb*
  rm -f $pkgdir/usr/bin/arm-none-eabi-gstack*
  rm -f $pkgdir/usr/share/man/man1/arm-none-eabi-gdb*
  rm -f $pkgdir/usr/share/man/man1/arm-none-eabi-gstack*
}

