# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Calle Erlandsson <calle@calleerlandsson.com>

pkgname=pick
pkgver=1.6.1
pkgrel=1
pkgdesc='Fuzzy text selection utility'
arch=('i686' 'x86_64')
url='https://github.com/calleerlandsson/pick'
license=('MIT')
depends=('ncurses')
source=("https://github.com/calleerlandsson/pick/releases/download/v$pkgver/pick-$pkgver.tar.gz"{,.asc})
validpgpkeys=('47B22252BF6914DF964BB50C24735DD835689C84') # Carl Olof Erlandsson
sha256sums=('b2d0384c376b697b7e8f17843485e6373514f001b35be18b6414a2fd5ced8d9b'
            'SKIP')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

check() {
  cd $pkgname-$pkgver
  make -k check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
