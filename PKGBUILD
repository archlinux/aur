# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=20.04
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
sha512sums=('592a5d56c41bd68c3bac04ea2f7cc1ba4e1a9a8d3c0266e778b5fc255905c1ea4f795f4f13b15c9acf4c8adac0f5bda4f5d9b615e2612217649c600cebceb7e4')

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
