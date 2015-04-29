# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=rage
pkgver=0.1.4
pkgrel=1
pkgdesc="Video Player based on EFL"
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/p.php?p=about/rage"
license=('BSD')
depends=('elementary')
install=$pkgname.install
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('7592b345aa6679c2e4d50a607191d5e4d41cd21d2fc71263df0ba5d9c974bd95')

build() {
  cd $pkgname-$pkgver

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd $pkgname-$pkgver

  make -j1 DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" ChangeLog NEWS README

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
