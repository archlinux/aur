# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=jwtd
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal TUI for decoding JWT "
arch=('x86_64')
url="https://github.com/javiorfo/jwtd"
license=('MIT')
depends=('ncurses' 'openssl' 'undr')
makedepends=('git' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('5ebc26f9ec24579906bc2821e8c372fa2f7d99a5e85b819f52a48a1b27b99ed5b01d78ce811910a3130b9d929e1889ac31198c4544d453d41865eaaf27da4860')

build() {
  cd "$pkgname"
  gcc -O2 -std=c23 -o jwtd jwtd.c -lcurses -lcrypto -lundr
}

package() {
  cd "$pkgname"

  install -Dm755 jwtd       "${pkgdir}/usr/bin/jwtd"
  install -Dm644 LICENSE    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
