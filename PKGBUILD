# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=20.13
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera, stable version"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('dcraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha512sums=('be702b3c62f7a98b8c147c5612d2f34a0fa1f658fc93bf79ad3ae3ffaca4dfdcd9dd6fdbea1bcfbc199606f5883967d55eb778850504b40f37fb544232ac1bbe')

prepare() {
  cd $pkgname
  sed -i 's+libchamplain+champlain+g' Makefile
  chmod o+r images/color-mode.jpg
}

build() {
  cd $pkgname
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install 
  rm -r "$pkgdir"/usr/share/appdata
  chmod o+r "$pkgdir"/usr/share/fotoxx/images/show-RGB.jpg
  sed -i 's+/usr/share/fotoxx/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
}
