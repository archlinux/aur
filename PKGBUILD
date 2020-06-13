# Maintainer: Adrian Kocis <adrian dot kocis at gmail>
# Maintainer: James An <james at jamesan dot ca>

pkgname=dupd-git
_pkgname=${pkgname%-git}
pkgver=1.7.r43.gf137a38
pkgrel=1
pkgdesc="CLI utility to find duplicate files"
arch=('i686' 'x86_64')
url="http://www.virkki.com/$_pkgname"
license=('GPL3')
depends=( 'openssl' 'sqlite')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/jvirkki/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_pkgname"
  make
}

check() {
  cd "$_pkgname"
  make test
}

package() {
    cd "$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
