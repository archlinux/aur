# Maintainer: David Herrmann <dh.herrmann@gmail.com>

_pkgorg=c-util
_pkgname=c-list
pkgdesc='Circular Double Linked List Implementation in Standard ISO-C11'
pkgver=1
pkgrel=1

pkgname=$_pkgname
arch=('i686' 'x86_64')
url="https://github.com/$_pkgorg/$_pkgname"
license=('Apache')
depends=('glibc')
makedepends=('meson')
source=("$pkgname.tar.gz::https://github.com/$_pkgorg/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0da914cc1257ec2d00e02860852bdd6c3688ac1fad0c5c630be3c417a652c03f')

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
