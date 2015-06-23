# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=mphidflash
pkgver=r24
pkgrel=1
pkgdesc="Flash utility for Microchip PIC microcontrollers with USB HID-Bootloader"
arch=("i686" "x86_64")
url="https://code.google.com/p/mphidflash"
license=("GPL3")
depends=()
makedepends=(svn gcc)
#options=('!strip')
source=("svn+http://mphidflash.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/trunk"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/trunk"
  if [ $CARCH = i686 ]; then
    make mphidflash32
  else
    make mphidflash64
  fi
}

package() {
  cd "$srcdir/trunk/binaries"
  if [ $CARCH = i686 ]; then
    install -D mphidflash-1.6-linux-32 $pkgdir/usr/bin/mphidflash
  else
    install -D mphidflash-1.6-linux-64 $pkgdir/usr/bin/mphidflash
  fi
}

# vim:sw=2:

