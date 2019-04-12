# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=19.8
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera, stable version"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha512sums=('1acf7d67855bc7435f47503c8522e80f6bbf3d8a31c173b495face2afc55a8434e9f3d80ac27c3e14495bc463717d36d3d1338578a93d21e577e7e54270335dc')

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
