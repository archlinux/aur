# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=23.2
pkgrel=3
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
source=("http://www.kornelix.net/downloads/downloads/$pkgname-$pkgver-source.tar.gz" fotoxx.patch)
sha256sums=('9e8098582c4b3dec51c6bf232670204e939372d0e9b66f281a0661ac36c2cce9'
            'ff52076287d84db6309789fe742b82f8fa79b208eca406973b84ba0962afecef')

prepare() {
  cd $pkgname
  patch -Np1 < "$srcdir"/fotoxx.patch
}

build() {
  cd $pkgname
  make PREFIX=/usr
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr ICONDIR=/usr/share/pixmaps install 
}
