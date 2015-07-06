#Author: Schrottfresse

pkgname=arduino-adafruitst7735library-git
pkgver=20140905
pkgrel=1
pkgdesc="A library for Adafruit tft displays."
arch=('any')
url="https://github.com/adafruit/Adafruit-ST7735-Library"
license=('MIT')
depends=('arduino')
makedepends=('git')

_gitroot="git://github.com/adafruit/Adafruit-ST7735-Library.git"
_gitname="Adafruit-ST7735-Library"
_futurefoldername="Adafruit-ST7735"


build() {
  cd "$srcdir"

  if [[ -d "$_gitname" ]]; then
    rm -rf "$_gitname"
  fi

  git clone "$_gitroot"

  rm -rf "$_gitname/.git"
}

package() {
  install -dm755 "$pkgdir/usr/share/arduino/libraries/$_futurefoldername"
  install -dm755 "$pkgdir/usr/share/arduino/examples/$_futurefoldername"

  cp "$srcdir/$_gitname/Adafruit_ST7735.cpp" "$pkgdir/usr/share/arduino/libraries/$_futurefoldername"
  cp "$srcdir/$_gitname/Adafruit_ST7735.h" "$pkgdir/usr/share/arduino/libraries/$_futurefoldername"
  cp "$srcdir/$_gitname/README.txt" "$pkgdir/usr/share/arduino/libraries/$_futurefoldername"
  chmod 755 "$pkgdir/usr/share/arduino/libraries/$_futurefoldername/" -R

  cp -r "$srcdir/$_gitname/examples/." "$pkgdir/usr/share/arduino/examples/$_futurefoldername"
  chmod 755 "$pkgdir/usr/share/arduino/examples/$_futurefoldername/" -R
}
