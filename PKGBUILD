# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgname=rage
pkgver=0.1.0
pkgrel=1
pkgdesc="Video Player based on EFL"
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/p.php?p=about/rage"
license=('BSD')
depends=('elementary>=1.11')
install=$pkgname.install
source=("http://download.enlightenment.org/rel/apps/$pkgname/$pkgname-$pkgver.tar.bz2")
sha256sums=('e477125bbc86adee91803a9585e83e670b3e5933890338d43c9f156161f06955')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./configure \
    --prefix=/usr

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make -j1 DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$pkgname/" ChangeLog NEWS README

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
