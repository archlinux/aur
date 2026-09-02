# Maintainer: caskstrength

pkgname=libundr
pkgver=0.6.0
pkgrel=1
pkgdesc="C library with multiple utilities"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/caskstrength/libundr"
license=('MIT')
depends=('glibc' 'openssl')
makedepends=('git' 'gcc' 'make')
provides=('undr')
conflicts=('undr')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('7c611715880b34fe4263aa624cbd740fa02565a7db9c8faf7a5b9b2e39649ea5ac577b82255ae72746b8a71881c5f4ef03be823171b85fbb1456d279924740f8')

build() {
  cd "${pkgname}"
  make CFLAGS="-Wall -Wextra -g -std=c23 -pedantic -Iinclude -fPIC -lcrypto" libundr.so
}

package() {
  cd "${pkgname}"
  
  install -d "${pkgdir}/usr/include/undr"
  install -d "${pkgdir}/usr/lib"

  install -m644 include/undr/*.h "${pkgdir}/usr/include/undr/"

  install -m755 libundr.so "${pkgdir}/usr/lib/libundr.so.${pkgver}"
  ln -s "libundr.so.${pkgver}" "${pkgdir}/usr/lib/libundr.so"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
