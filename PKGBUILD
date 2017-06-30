# Maintainer: Michael Straube <straubem@gmx.de>
# Contributor: Calle Erlandsson <calle@calleerlandsson.com>

pkgname=pick
pkgver=1.7.0
pkgrel=1
pkgdesc='Fuzzy text selection utility'
arch=('i686' 'x86_64')
url='https://github.com/calleerlandsson/pick'
license=('MIT')
depends=('ncurses')
source=("https://github.com/calleerlandsson/pick/releases/download/v$pkgver/pick-$pkgver.tar.gz"{,.asc}
        "pick-gcc7.patch")
validpgpkeys=('47B22252BF6914DF964BB50C24735DD835689C84') # Carl Olof Erlandsson
sha256sums=('950531c56edc4be375fe4e89291caa807322b298143043e2e2963de34e96de15'
            'SKIP'
            'ac677ccf6c7d8bc5b4202248cfb180705403a1a39870417af9470e29bfb505cc')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../pick-gcc7.patch
}

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
