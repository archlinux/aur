# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=17.04.1
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libraw' 'gtk3' 'libchamplain' 'perl-image-exiftool>=0.8.6' 'xdg-utils')
optdepends=('mashup: for composing pages to print from within fotoxx' 
	    'rawtherapee: for raw image processing'
	    'dvd+rw-tools: for burning CDs,DVDs or BlueRays'
	    'hugin: for panorama photos')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz" 'no_leafpad.patch')
sha512sums=('35953990681dd9e0c03848040059b174673ed3deffd8c62af88f40f7589c0b4955e5603736111dcd86f1d39cff45c31a5763eba8628ef5164f1b6234b1aef141'
            '803282be84e5065addb10841ed22c81821897f65b4efecf460d150c322e89384a2b13346cae832b5923d6634436e4b672ba72b3c1d56dd5cd2f2f4749c724b82')
options=('!makeflags')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/no_leafpad.patch || true
}

build() {
  cd $pkgname-$pkgver
  CXX=g++ make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir PREFIX=/usr install
  rm -r "$pkgdir"/usr/share/appdata
}
