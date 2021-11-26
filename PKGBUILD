# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo
pkgver=11.0
pkgrel=2
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
source=($pkgname-$pkgver.tar.gz::https://github.com/blippy/neoleo/archive/v$pkgver.tar.gz io-curses.patch)
sha256sums=('2c24839ee68c332dccc0187bcd2461afee131c23f7f89743d78b36ff2857c36f'
            'b1c89e5b4f9eaf887c8bdb9d0a54d2b150869c71a6018fae700f119ca43a0983')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < "$srcdir"/io-curses.patch
}

build() {
  cd "$pkgname-$pkgver"
  autoreconf -iv
  LIBS+="-lstdc++fs" ./configure --prefix=/usr 
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
