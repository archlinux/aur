# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=jwtd
pkgver=0.1.0
pkgrel=2
pkgdesc="Minimal TUI for decoding JWT "
arch=('x86_64')
url="https://codeberg.org/caskstrength/jwtd"
license=('MIT')
depends=('ncurses' 'openssl' 'undr')
makedepends=('git' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('6b28fef3378cc2a98d0564b86552955c139b8606e75f0303e7a6a6a19869524bdc34a3e34cd464c17eae1aa3d9c5fc213d19fd013dcebb8eb2a150d5f3371327')

build() {
  cd "$pkgname"
  gcc -O2 -std=c23 -o jwtd jwtd.c -lcurses -lcrypto -lundr
}

package() {
  cd "$pkgname"

  install -Dm755 jwtd       "${pkgdir}/usr/bin/jwtd"
  install -Dm644 LICENSE    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
