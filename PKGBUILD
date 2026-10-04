# Maintainer: javy

pkgname=jwtd
pkgver=0.2.2
pkgrel=1
pkgdesc="Minimal TUI for decoding JWT "
arch=('x86_64')
url="https://codeberg.org/javy/jwtd"
license=('MIT')
depends=('ncurses' 'openssl' 'libundr')
makedepends=('git' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('dd16fdd99981bfe3187b218db8fa3d1008c090a779e45c480b27f15545540cc6d2cbb5d963693bee19eeb38fa961913f420e7cfb1a5359311c66db696380e1f6')

build() {
  cd "$pkgname"
  gcc -Wall -Wextra -pedantic -std=c23 -o jwtd jwtd.c -lcurses -lcrypto -lcurl -lundr
}

package() {
  cd "$pkgname"

  install -Dm755 jwtd       "${pkgdir}/usr/bin/jwtd"
  install -Dm644 LICENSE    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
