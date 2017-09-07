# Maintainer : Thomas Steinholz <tsteinholz@protonmail.com>

pkgname=blackjack-git
pkgver=1.0.0
pkgrel=1
pkgdesc="A fun little game of Black Jack."
arch=('i686' 'x86_64')
url="https://github.com/tsteinholz/BlackJack"
license=('MIT')
depends=('allegro>=5.0.11-1')
makedepends=('git' 'cmake')
md5sums=('SKIP'
         '09ec21702a3dde391e4622af691d3fad'
         '6078e49f2a89356fee32a8b27068099f')
source=('git+https://github.com/tsteinholz/BlackJack'
        'path.diff'
        'blackjack')

prepare() {
 cd "$srcdir/BlackJack"
 patch -i "$srcdir/path.diff"
}

build() {
 cd "$srcdir/BlackJack"
 cmake .
 make
}

package() {
 cd "$srcdir/BlackJack"
 make DESTDIR="$pkgdir/" install
 cp -rf "$srcdir/BlackJack/res" "$pkgdir/opt/blackjack"
 install -Dm755 "$srcdir/blackjack" "$pkgdir/usr/bin/blackjack"
 install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
