# Maintainer: Christoph Ruegge <mail@cxcs.de>
pkgname=pam-gnupg
pkgver=0.3
pkgrel=1
pkgdesc="Unlock GnuPG keys on login"
arch=('i686' 'x86_64')
url="https://github.com/cruegge/pam-gnupg"
license=('GPL3')
depends=('pam' 'gnupg')
source=("https://github.com/cruegge/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d179c355ffc7bc79c3503c2422f181626229ca9491cfbb44668146e6fd55a303')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --with-moduledir=/usr/lib/security
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
