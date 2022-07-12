# Maintainer: Darren Ng <$(base64 --decode <<<'VW4xR2ZuQGdtYWlsLmNvbQo=')>

pkgname=ldid-git
pkgver=v2.1.5.r63.g685ead2
pkgrel=1
pkgdesc="a tool used for ad-hoc codesigning iOS binaries"
arch=('any')
url="https://github.com/ProcursusTeam/ldid"
license=(AGPL3)
provides=('ldid' 'ldid2')
conflicts=('ldid' 'ldid2')
depends=(
  'libplist'
  'libxml2'
  'openssl'
)
makedepends=(
  'git'
  'gcc'
  'make'
)
source=("$pkgname::git+https://github.com/ProcursusTeam/ldid#branch=master")
sha512sums=("SKIP")

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "0.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make install \
    DESTDIR="$pkgdir" \
    PREFIX="/usr"
}
