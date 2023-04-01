# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=rogue
pkgver=5.4.5
pkgrel=1
pkgdesc="The original dungeon crawl game."
arch=('x86_64')
#url="http://rogue.rogueforge.net/rogue-5-4/"
url="http://www.roguebasin.com/index.php?title=Rogue"
license=('custom')
depends=('ncurses')
provides=('rouge')  # so the illiterate can find it in searches too
source=("$pkgname-$pkgver.tgz::https://github.com/phs/rogue/archive/v$pkgver.tar.gz")
sha256sums=('aea2204f046576e06ba1bc53808cc193306e4a694a92a573e739289117f91a41')

prepare() {
  cd $pkgname-$pkgver
  # ncurses fix, FS#57731
  sed -i '262i TERMTYPE *tp = (TERMTYPE *) (cur_term);' mdport.c
  sed -i 's/cur_term->type.Strings/tp->Strings/' mdport.c
}

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 rogue "$pkgdir/usr/bin/rogue"
  install -Dm644 rogue.6 "$pkgdir/usr/share/man/man6/rogue.6"
  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE.TXT"
}
