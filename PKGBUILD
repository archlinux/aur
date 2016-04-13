# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=fotoxx
pkgver=16.04.1
pkgrel=1
pkgdesc="A program for improving image files made with a digital camera"
url="http://www.kornelix.net/fotoxx/fotoxx.html"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('dcraw' 'gtk3' 'perl-image-exiftool>=0.8.6')
makedepends=('xdg-utils')
optdepends=('mashup: for composing pages to print from within fotoxx' 
  'brasero: for burning')
source=("http://www.kornelix.net/downloads/tarballs/$pkgname-$pkgver.tar.gz")
md5sums=('59544973fc74be73cab14885dff838cb')
install=fotoxx.install

prepare() {
  cd $pkgname-$pkgver
  sed -i 's+xdg-deskto+#xdg-deskto+' Makefile
}

build() {
  cd $pkgname-$pkgver
  CXX=g++ make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir PREFIX=/usr install
  chmod o+r "$pkgdir"/usr/share/fotoxx/data/{edit-menus-es,edit-menus-ca,KB-shortcuts-es,KB-shortcuts-ca}
  rm -r "$pkgdir"/usr/share/appdata
}
