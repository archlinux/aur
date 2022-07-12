# Maintainer: Christoph Ruegge <mail@cxcs.de>
pkgname=pam-gnupg-git
pkgver=r52.a7a34e6
pkgrel=1
pkgdesc="Unlock GnuPG keys on login"
arch=('i686' 'x86_64')
url="https://github.com/cruegge/pam-gnupg"
license=('GPL3')
depends=('pam' 'gnupg')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cruegge/pam-gnupg.git')
md5sums=('SKIP')

pkgver() {
  cd pam-gnupg
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  ./autogen.sh
  ./configure --prefix=/usr --with-moduledir=/usr/lib/security --libexecdir="/usr/lib/$pkgname"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}
