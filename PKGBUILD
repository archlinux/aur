# Maintainer: Michał Szymański <smiszym at gmail dot com>
# Contributor: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Michal Karas <largon@largon.net>

pkgname=pipepanic
pkgver=0.1.3
pkgrel=4
pkgdesc="Pipe connecting game using libSDL"
arch=('i686' 'x86_64')
url="http://www.users.waitrose.com/~thunor/pipepanic/"
license=('GPL2')
depends=('sdl')
source=("http://www.users.waitrose.com/~thunor/pipepanic/dload/$pkgname-$pkgver-source.tar.gz")
md5sums=('99b68e990012b2f58c184b8ba9e4fb4d')

build() {
  cd "$srcdir/$pkgname-$pkgver-source"
  sed -i 's#\(\#define DATADIR \).*$#\1"/usr/share/pipepanic/"#' main.h
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-source"
  install -dm755 "$pkgdir/usr/share/pipepanic"
  install -m644 -t "$pkgdir/usr/share/pipepanic/" {*.png,*.bmp,*.xcf}
  install -Dm755 pipepanic "$pkgdir/usr/bin/pipepanic"
}
