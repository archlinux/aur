# Maintainer: Thibaut Sautereau (thithib) <thibaut at sautereau dot fr>

pkgname=hardened_malloc
pkgver=11
pkgrel=1
pkgdesc="Hardened allocator designed for modern systems"
arch=('x86_64')
url="https://github.com/GrapheneOS/hardened_malloc"
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
checkdepends=('python')
provides=('libhardened_malloc.so' 'libhardened_malloc-light.so')
source=("git+https://github.com/GrapheneOS/$pkgname#tag=$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('65EEFE022108E2B708CBFCF7F9E712E59AF5F22A') # Daniel Micay <danielmicay@gmail.com>

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
