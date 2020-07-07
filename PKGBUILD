# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.146
pkgrel=2
pkgdesc="A powerful Newsgroup Article reader"
arch=(x86_64)
url="http://pan.rebelbase.com/"
license=(GPL2)
depends=(gtkspell3 gmime)
makedepends=(intltool itstool gtk2)
source=("http://pan.rebelbase.com/download/releases/$pkgver/source/$pkgname-$pkgver.tar.bz2")
sha256sums=('a52c28664652ddbd1639faf99cdb93969c3dd3e0e0ddb9a1b24711ab8f684f9d')

prepare() {
  cd $pkgname-$pkgver
  sed -e 's/enchant/enchant-2/g' -i configure.ac
  sed -e 's|enchant/enchant.h|enchant-2/enchant.h|' -i pan/gui/group-prefs-dialog.cc
  autoreconf -vi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-gnutls --with-gtk3
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
