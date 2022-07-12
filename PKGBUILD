# Maintainer: Christoph Ruegge <mail@cxcs.de>
pkgname=pam-gnupg
pkgver=0.4
pkgrel=1
pkgdesc="Unlock GnuPG keys on login"
arch=('i686' 'x86_64')
url="https://github.com/cruegge/pam-gnupg"
license=('GPL3')
depends=('pam' 'gnupg')
source=("https://github.com/cruegge/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d7d266ffaa493fee087d373d70ae5f25a8afb145bc9b7c3cc60b7a448dd65756')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --with-moduledir=/usr/lib/security --libexecdir="/usr/lib/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
