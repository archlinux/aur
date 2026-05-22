# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=jwtd
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal TUI for decoding JWT "
arch=('x86_64')
url="https://codeberg.org/caskstrength/jwtd"
license=('MIT')
depends=('ncurses' 'openssl' 'undr')
makedepends=('git' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('298f47c4f45c1c27887f0c42795f33d7ef55b66a1bb06909bdc5918bd30f714cbcbc47ec319a03fc995829162af71ddde811816e093b7f29dde97fb654c5d25f')

build() {
  cd "$pkgname"
  gcc -Wall -Wextra -pedantic -std=c23 -o jwtd jwtd.c -lcurses -lcrypto -lundr
}

package() {
  cd "$pkgname"

  install -Dm755 jwtd       "${pkgdir}/usr/bin/jwtd"
  install -Dm644 LICENSE    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
