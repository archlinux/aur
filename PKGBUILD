# Maintainer: Thibaut Sautereau (thithib) <thibaut at sautereau dot fr>

pkgname=hardened_malloc
pkgver=13
pkgrel=1
pkgdesc="Hardened allocator designed for modern systems"
arch=('x86_64')
url="https://github.com/GrapheneOS/hardened_malloc"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
checkdepends=('python')
provides=('libhardened_malloc.so' 'libhardened_malloc-light.so')
source=("git+https://github.com/GrapheneOS/$pkgname#tag=$pkgver")
sha256sums=('3e48dcfd888b3a871c0d59c6757ab328eb008e1951843c1dc75225432a4bf7db')

build() {
  cd "$pkgname"
  make VARIANT=default
  make VARIANT=light
}

check() {
  make -C "$pkgname" test
}

package() {
  cd "$pkgname"
  install -vDm755 -t "$pkgdir/usr/lib" out/libhardened_malloc.so out-light/libhardened_malloc-light.so
  install -vDm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set sts=2 sw=2 et:
