# Maintainer: Peter Ivanov <ivanovp@gmail.com>

pkgname=mphidflash
pkgver=20160616
pkgrel=1
pkgdesc="Flash utility for Microchip PIC microcontrollers with USB HID-Bootloader"
arch=("i686" "x86_64")
url="https://code.google.com/p/mphidflash"
license=("GPL3")
depends=()
makedepends=(svn gcc)
#options=('!strip')
source=("$pkgname::git+https://github.com/ApertureLabsLtd/mphidflash")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
  cd "$srcdir/$pkgname"
  if [ $CARCH = i686 ]; then
    make mphidflash32
  else
    make mphidflash64
  fi
}

package() {
  cd "$srcdir/$pkgname/binaries"
  if [ $CARCH = i686 ]; then
    install -D mphidflash-1.6-linux-32 $pkgdir/usr/bin/mphidflash
  else
    install -D mphidflash-1.6-linux-64 $pkgdir/usr/bin/mphidflash
  fi
}

# vim:sw=2:

