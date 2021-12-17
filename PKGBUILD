# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>

pkgname=pan
pkgver=0.148
pkgrel=1
pkgdesc='A powerful Newsgroup Article reader'
arch=(x86_64)
url='http://pan.rebelbase.com/'
license=(GPL2)
depends=(gtkspell3 gmime3)
source=(https://pan.rebelbase.com/download/releases/$pkgver/source/pan-$pkgver.tar.gz
        pan-enchant-2.patch)
sha256sums=('95798df5b5428d1134b41b7e0554d67131842706cd042605f50c79189cb5a28c'
            '1e4928c3cd555d0e4dc8b880e14e1409fe0647035addcc93359fb1800c4e7cfd')

prepare() {
  cd pan-$pkgver
  sed -e '/gtk+-2.0/d' -i configure.ac
  patch -p1 -i ../pan-enchant-2.patch # Fix build with enchant 2
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd pan-$pkgver
  ./configure --prefix=/usr --with-gnutls --with-gtk3 --with-gtkspell
  make
}

package() {
  cd pan-$pkgver
  make DESTDIR="$pkgdir" install
}
