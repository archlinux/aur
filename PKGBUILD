# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: chochem <chochem@gmail.com>

pkgname=myman
pkgver=0.7.0
pkgrel=6
pkgdesc='Pacman clone with an ncurses and a 'graphic' interface'
arch=('i686' 'x86_64')
url='http://myman.sourceforge.net/'
license=('BSD')
depends=('ncurses')
makedepends=('make>=3.80')
optdepends=('xterm: Launch game with xmyman wrapper'
            'rxvt-unicode: Launch game with xmyman2 wrapper'
            'kterm: Launch game with xmyman4 wrapper')
source=("http://xent.com/~bsittler/$pkgname-$pkgver.tar.gz")
sha512sums=('7a5268fa9a9275c8d46b57cf714e889c221581a5cbe19b388e6a6023667f9941f764af6be47fbf1f11a430f149fbf6a7a0bb5be2dd92b16c07020f9de8fc98b6')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix="$pkgdir/usr" --with-xterm --with-rxvt --with-kterm
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install
  rm -r "$pkgdir/usr/share/man/cat6"
  rm "$pkgdir/usr/share/man/index.db"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
