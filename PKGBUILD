# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=undr
pkgver=0.1.0
pkgrel=1
pkgdesc="C library with multiple utilities"
arch=('x86_64' 'aarch64')
url="https://github.com/javiorfo/undr"
license=('MIT')
depends=('glibc' 'openssl')
makedepends=('git' 'gcc' 'make')
provides=('undr')
conflicts=('undr')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha256sums=('a3a873ff2a38c460727bb95ebe22194619b7043fcaa90380a8475bf6d6a2685d')

build() {
  cd "${pkgname}"
  make CFLAGS="-Wall -O2 -g -std=c23 -Iinclude -fPIC -lcrypto" libundr.so
}

package() {
  cd "${pkgname}"
  
  install -d "${pkgdir}/usr/include/undr"
  install -d "${pkgdir}/usr/lib"

  install -m644 include/undr/*.h "${pkgdir}/usr/include/undr/"

  install -m755 libundr.so "${pkgdir}/usr/lib/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
