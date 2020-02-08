# Maintainer: Ariel AxionL <axionl@aosc.io>
# Contributor: GreaterFire <GreaterFire@protonmail.com>

pkgname=trojan-git
pkgver=r427.7cfe059
pkgrel=2
pkgdesc="An unidentifiable mechanism that helps you bypass GFW"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/trojan-gfw/trojan"
license=('GPL3')
depends=('boost-libs' 'openssl' 'mariadb-libs')
optdepends=('ca-certificates: server certificate verification'
            'mariadb: advanced user management')
makedepends=('git' 'cmake' 'boost' 'openssl' 'mariadb-libs')
checkdepends=('openssl' 'python' 'curl' 'netcat')
conflicts=('trojan')
provides=('trojan')
source=("$pkgname::git+$url")
backup=('etc/trojan/config.json')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

check() {
  cd $pkgname
  ctest
}

package() {
  cd $pkgname
  make DESTDIR=$pkgdir install
}
