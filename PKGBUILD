# Maintainer: Vadzim Dambrouski <pftbest gmail.com>
pkgname=msp430-elf-gcc-bin
pkgver=8.2.0.52
pkgrel=1
pkgdesc="GNU Tools for TI MSP430 microcontroller family (binary distribution, release 8_2_0_0)"
arch=('x86_64')
depends=('glibc' 'gcc')
optdepends=('msp430-elf-mcu')
provides=(
  'msp430-elf-gcc'
  'msp430-elf-gdb'
  'msp430-elf-binutils'
  'msp430-elf-newlib'
)
conflicts=(
  'msp430-elf-gcc'
  'msp430-elf-gdb'
  'msp430-elf-binutils'
  'msp430-elf-newlib'
)
url="http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/index_FDS.html"
source=("http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/8_2_0_0/exports/msp430-gcc-8.2.0.52_linux64.tar.bz2")
license=('GPL')
options=(!strip staticlibs)
sha256sums=('03a51e807cec7e79ef256b1687cacd581b6693f729f75ea7245c310d76554076')

package() {
  mkdir -p $pkgdir/usr/share/man
  mkdir -p $pkgdir/usr/share/msp430-gcc
  cd $srcdir/msp430-gcc-$pkgver*/
  cp -a bin        $pkgdir/usr/
  cp -a lib        $pkgdir/usr/
  cp -a libexec    $pkgdir/usr/
  cp -a msp430-elf $pkgdir/usr/
  cp -a share/man/man1 $pkgdir/usr/share/man/
  cp -a share/man/man5 $pkgdir/usr/share/man/
  cp -a *.* $pkgdir/usr/share/msp430-gcc/
  # fixup permissions
  find $pkgdir/ -perm 0700 -exec chmod 755 "{}" \;
  find $pkgdir/ -perm 0600 -exec chmod 644 "{}" \;
}
