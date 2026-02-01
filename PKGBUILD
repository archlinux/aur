pkgname=secretd
pkgver=5ed991f
pkgrel=1
pkgdesc="Local-first encrypted password manager"
arch=('x86_64')
url="https://github.com/saintmili/secretd"
license=('MIT')
depends=()
makedepends=('go' 'git')
source=("git+https://github.com/saintmili/secretd.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags --dirty --always \
    | sed 's/^v//' \
    | sed 's/-/.r/' \
    | sed 's/-/./'
}

build() {
  cd "$srcdir/$pkgname"
  make build
}

package() {
  cd "$srcdir/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
