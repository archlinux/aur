# Maintainer: Christoph Ruegge <mail@cxcs.de>
pkgname=pam-gnupg
pkgver=0.2
pkgrel=1
pkgdesc="Unlock GnuPG keys on login"
arch=('i686' 'x86_64')
url="https://github.com/cruegge/pam-gnupg"
license=('GPL3')
depends=('pam' 'gnupg')
source=("https://github.com/cruegge/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('397334c45ed48499a466c0cb2acb21a7405edc4c0ab9c63cc6b2f3d159d60e5f')

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
