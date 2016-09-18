# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.140
pkgrel=2
pkgdesc="A powerful Newsgroup Article reader"
arch=(i686 x86_64)
url="http://pan.rebelbase.com/"
license=(GPL2)
depends=(gtkspell3 webkitgtk gmime)
makedepends=(intltool)
source=("http://pan.rebelbase.com/download/releases/$pkgver/source/$pkgname-$pkgver.tar.bz2")
md5sums=('6c6a879e8ea73efbb5512ac00977fd82')

prepare() {
  cd $pkgname-$pkgver
  sed -e 's|@WEBKITGTK_CFLAGS@-DPANLOCALEDIR|@WEBKITGTK_CFLAGS@ -DPANLOCALEDIR|' -i pan/gui/Makefile.am
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-gtk3 --with-webkit --with-gnutls
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
