# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=17.08
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
sha512sums=('ca67cd3568824179671120111edbd6cdd64d5b5c38124012837dcde7dd61f594b3028a2a182cf53e0e8c83c9d418c4f7e876f17e571555e9a761b0bcb8a1fc85'
            'ea97fcc4d2442c872fafe0a5f748a975c3cc08018f72e4813985a3515921b7128aea70c51a63c847fa24378de06e369784e220cd636b5eec2ce80c99c79a3738')
options=('!makeflags')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 < "$srcdir"/no_leafpad.patch || true
}

build() {
  cd $pkgname-$pkgver
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir PREFIX=/usr install
  rm -r "$pkgdir"/usr/share/appdata
}
