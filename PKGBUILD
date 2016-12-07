# Maintainer: David Herrmann <dh.herrmann@gmail.com>

_pkgorg=nettools
_pkgname=n-acd
pkgdesc="IPv4 Address Conflict Detection"
pkgver=r40.a55f547
pkgrel=1

pkgname=$_pkgname-git
arch=('i686' 'x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('Apache')
depends=('glibc')
makedepends=('git')
options=('debug' '!strip')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/$_pkgorg/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  ./autogen.sh c
  make
}

check() {
  cd "$pkgname"
  make check
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
