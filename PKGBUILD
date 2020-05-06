# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=20.12
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
sha512sums=('9cf2e52243558eb2bf6e9ec3dc6abf2134ef9c95dc32a539eb55f79728bd5d18bea822128f1d9c8a6aac65f87d3a27088c09db739752ee5e2de47ebaa5091c6b')

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
