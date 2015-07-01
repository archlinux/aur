# Maintainer: Jason Gerecke <killertofu@gmail.com> 
pkgname=intuos4-led
pkgver=0.003
pkgrel=1
pkgdesc="Command line tool to set the Wacom Intuos4 tablet’s LED displays"
arch=('i686' 'x86_64')
url="http://braindump.kargulus.de/?p=432"
license=('GPL3')
depends=('libusb' 'imagemagick')
makedepends=('gcc' 'make')
source=("http://braindump.kargulus.de/wp-content/uploads/${pkgname}-${pkgver}.tar.gz")
md5sums=('96bcad7e86472ec1be53b259d9aa200f')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  sed -i 's/ImageMagick/\0-6/' Makefile
  MAGICK=$()
  sed -i "s/\-lMagick++/$(Magick++-config --ldflags)/" Makefile
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  install -Dm 755 intuos4-led-check ${pkgdir}/usr/bin/intuos4-led-check
  install -Dm 755 intuos4-led-config ${pkgdir}/usr/bin/intuos4-led-config
}
