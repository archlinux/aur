# Maintainer: Javier Orfo <javierorfo@protonmail.com>

pkgname=jwtd
pkgver=0.2.1
pkgrel=2
pkgdesc="Minimal TUI for decoding JWT "
arch=('x86_64')
url="https://codeberg.org/caskstrength/jwtd"
license=('MIT')
depends=('ncurses' 'openssl' 'libundr')
makedepends=('git' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('56f174ae79453ab228773cdf1846e8701a30956101435d8e1d28538508f3594afeab370c600b100cc51b542c6f07351d6014839c45e79f0e245c9c0c2ecfdc8c')

build() {
  cd "$pkgname"
  gcc -Wall -Wextra -pedantic -std=c23 -o jwtd jwtd.c -lcurses -lcrypto -lundr
}

package() {
  cd "$pkgname"

  install -Dm755 jwtd       "${pkgdir}/usr/bin/jwtd"
  install -Dm644 LICENSE    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
