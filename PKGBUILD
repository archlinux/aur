# Maintainer: Thibaut Sautereau (thithib) <thibaut at sautereau dot fr>

pkgname=hardened_malloc
pkgver=12
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
sha256sums=('0e683c105fe17ccd23060ad3f5f3ce62b989cb80ef8ce95f70efc63bf63974d6')

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
