# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=undr
pkgver=0.4.0
pkgrel=2
pkgdesc="C library with multiple utilities"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/caskstrength/undr"
license=('MIT')
depends=('glibc' 'openssl')
makedepends=('git' 'gcc' 'make')
provides=('undr')
conflicts=('undr')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('98568e2ebfe74479085dbb2e6ccbef31081f13c13b9b77abece8c5ba3de06d322b676488651545129252252550ddec257e00009accdcbd1ce22ab7b070c0dde7')

build() {
  cd "${pkgname}"
  make CFLAGS="-Wall -Wextra -g -std=c23 -pedantic -Iinclude -fPIC -lcrypto" libundr.so
}

package() {
  cd "${pkgname}"
  
  install -d "${pkgdir}/usr/include/undr"
  install -d "${pkgdir}/usr/lib"

  install -m644 include/undr/*.h "${pkgdir}/usr/include/undr/"

  install -m755 libundr.so "${pkgdir}/usr/lib/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
