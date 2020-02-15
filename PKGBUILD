# Maintainer: Christoph Ruegge <mail@cxcs.de>
pkgname=pam-gnupg
pkgver=0.1
pkgrel=1
pkgdesc="Unlock GnuPG keys on login"
arch=('i686' 'x86_64')
url="https://github.com/cruegge/pam-gnupg"
license=('GPL3')
depends=('pam' 'gnupg')
source=("https://github.com/cruegge/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('b6e1a018185fb0ed467fa33e25998a9d666634da3828f8e4497e5d3739a59dc4')

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
