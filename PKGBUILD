# Maintainer: krumelmonster <krumelmonster@zoho.com>
# Contributor: Michał Szymański <smiszym at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Michal Karas <largon@largon.net>

pkgname=pipepanic
pkgver=0.1.3
pkgrel=6
pkgdesc="Pipe connecting game using libSDL"
arch=('i686' 'x86_64')
url="http://www.users.waitrose.com/~thunor/pipepanic"
license=('GPL' 'custom:Free Art License')
depends=('sdl')
makedepends=('gendesk')
source=("http://www.users.waitrose.com/~thunor/pipepanic/dload/pipepanic-$pkgver-source.tar.gz")
sha256sums=('4b02249c92228b03f4cc3c1d999cacf3fe52c16df53c6bf76fc6c1e2caa74318')

prepare() {
  cd $pkgname-$pkgver-source
  sed -i 's|DATADIR.*$|DATADIR "/usr/share/pipepanic/"|' main.h
  sed -i "s|CFLAGS=-O2|CFLAGS=$CPPFLAGS $CFLAGS|" Makefile
  gendesk -f -n --pkgname=$pkgname --pkgdesc="$pkgdesc"
}

build() {
  cd $pkgname-$pkgver-source
  make
}

package() {
  cd $pkgname-$pkgver-source
  install -dm755 "$pkgdir"/usr/share/pipepanic
  install -m644 *.bmp "$pkgdir"/usr/share/pipepanic/
  install -Dm755 pipepanic "$pkgdir"/usr/bin/pipepanic
  install -Dm644 pipepanic.desktop "$pkgdir"/usr/share/applications/pipepanic.desktop
  install -Dm644 PipepanicIcon64.png "$pkgdir"/usr/share/pixmaps/pipepanic.png
  install -Dm644 COPYING-ARTWORK "$pkgdir"/usr/share/licenses/$pkgname/COPYING-ARTWORK
}
