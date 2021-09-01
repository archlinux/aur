# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=21.51
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera, stable version"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('dcraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos'
	    'darktable: organize and develop raw images')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('55116f0a71b64962ddbf34e1df885ad00aa6bd0ae0280654f4d1674b4d9b6f38')

prepare() {
  cd $pkgname
  #sed -i 's+libchamplain+champlain+g' Makefile
  chmod o+r images/color-mode.jpg
}

build() {
  cd $pkgname
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install 
  sed -i 's+/usr/share/fotoxx/icons/++' "$pkgdir"/usr/share/applications/$pkgname.desktop
  sed -i 's+Icon=fotoxx.png+Icon=fotoxx+' "$pkgdir"/usr/share/applications/$pkgname.desktop
  find "$pkgdir"/usr/share/fotoxx -type f -exec chmod o+r {} \;
  chmod o+r "$pkgdir"/usr/share/applications/fotoxx.desktop
  chmod o+r "$pkgdir"/usr/share/doc/fotoxx/"F21.51 changes"
  chmod o+r "$pkgdir"/usr/share/doc/fotoxx/README
  chmod o+r "$pkgdir"/usr/share/doc/fotoxx/changelog
  chmod o+r "$pkgdir"/usr/share/doc/fotoxx/copyright
  chmod o+r "$pkgdir"/usr/share/doc/fotoxx/license
  chmod o+r "$pkgdir"/usr/share/pixmaps/fotoxx.png 
}
