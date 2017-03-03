# Maintainer: David Herrmann <dh.herrmann@gmail.com>

_pkgorg=c-util
_pkgname=c-list
pkgdesc='Circular Double Linked List Implementation in Standard ISO-C11'
pkgver=r13.208f4a2
pkgrel=1

pkgname=$_pkgname-git
arch=('i686' 'x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('Apache')
depends=('glibc')
makedepends=('git' 'meson')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+https://github.com/$_pkgorg/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  rm -Rf "build"
  meson --prefix=/usr --buildtype=release "$pkgname" "build"
  ninja -v -C "build"
}

check() {
  ninja -v -C "build" test
}

package() {
  DESTDIR="$pkgdir" ninja -v -C "build" install
}
