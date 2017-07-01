# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=17.04.3
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
sha512sums=('cf4b4a920c8f69ff8f5dbcfd96778f12859187c4aa382aee134a2c41ea3e3e05103a4ce3ba2c698ff6cd46b2c83bf6c162f389d6872dcd79fd766d569c4b9b6f'
            '7f119d502ac8281935f02b1e60788e1db76012b882b971ceb7c82fec9e6843b4449f7dc18a050e910c375d9de6287b26da4074fb734a2f6c0839e4cf0cb1d393')
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
