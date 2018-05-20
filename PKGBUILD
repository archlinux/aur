# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.145
pkgrel=1
pkgdesc="A powerful Newsgroup Article reader"
arch=(x86_64)
url="http://pan.rebelbase.com/"
license=(GPL2)
depends=(gtkspell gmime)
makedepends=(intltool itstool gtk2)
source=("http://pan.rebelbase.com/download/releases/$pkgver/source/$pkgname-$pkgver.tar.bz2")
sha256sums=('68da514a8088513502b418859a7df7638866f75d03a429197cf9c23176559cac')

prepare() {
  cd $pkgname-$pkgver
  sed -e 's/enchant/enchant-2/g' -i configure.ac
  sed -e 's|enchant/enchant.h|enchant-2/enchant.h|' -i pan/gui/group-prefs-dialog.cc
  autoreconf -vi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --with-gnutls
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
