# Maintainer: Daniël de Kok <me@danieldk.eu>
pkgname=ledger-mode
pkgver=3.1.1
pkgrel=1
pkgdesc="An Emacs mode for ledger CLI"
arch=("any")
url="https://github.com/ledger/ledger-mode/"
license=("GPL2")
depends=('emacs' 'ledger')
makedepends=('cmake')
source=("https://github.com/ledger/$pkgname/archive/v$pkgver.tar.gz"
        "add-ledger-check.patch")
sha256sums=('cb1087bf89beb3e38d51c621604c67ec2995fada6e819904ef5276231140cf74'
            '619a68e4ebef895798d835cc8395037fd3962d9460f533bb50e749f6de76440a')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 < "$srcdir"/add-ledger-check.patch
}

build() {
  cd "$pkgname-$pkgver"
  cmake . \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
