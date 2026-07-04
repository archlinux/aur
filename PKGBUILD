# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=undr
pkgver=0.3.1
pkgrel=1
pkgdesc="C library with multiple utilities"
arch=('x86_64' 'aarch64')
url="https://codeberg.org/caskstrength/undr"
license=('MIT')
depends=('glibc' 'openssl')
makedepends=('git' 'gcc' 'make')
provides=('undr')
conflicts=('undr')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('a6561970372778cb2ebf5cb5ce025e0f29308af7ff122ced7fb3051c67175cf070bc4dd838178c63d3d6b7e54f049d4e72d5157cb32b083935217e5b457e0a5a')

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
