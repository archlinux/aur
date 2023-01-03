# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=23.0
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera, stable version"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('dcraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos'
	    'darktable: organize and develop raw images'
	    'ghostscript: handle .pdf, .ps or eps-files'
	    'vlc: for viewing films')
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver.tar.gz")
sha256sums=('7629edde4053ea6ebb815e84f5717e32982ad2c2ef0d00412c9719294f5122d7')

prepare() {
  cd $pkgname
  sed -i 's+/usr/share/fotoxx/icons/++' $pkgname.desktop
  sed -i 's+Icon=fotoxx.png+Icon=fotoxx+' $pkgname.desktop
}

build() {
  cd $pkgname
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install 
}
