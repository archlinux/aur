# Maintainer: David Herrmann <dh.herrmann@gmail.com>

_pkgorg=c-util
_pkgname=c-rbtree
pkgdesc='Red-Black Tree Implementation'
pkgver=2
pkgrel=1

pkgname=$_pkgname
arch=('i686' 'x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('Apache')
depends=('glibc')
makedepends=('meson')
source=("$pkgname.tar.gz::https://github.com/$_pkgorg/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('e7b2a450073b7708c351318e6c096393')

build() {
  rm -Rf "build"
  meson --prefix=/usr --buildtype=release "$pkgname-$pkgver" "build"
  ninja -v -C "build"
}

check() {
  ninja -v -C "build" test
}

package() {
  DESTDIR="$pkgdir" ninja -v -C "build" install
}
