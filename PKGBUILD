# Maintainer: Javier Orfo <javierorfo@protonmail.com>
#
pkgname=xtatusbar
pkgver=0.1.1
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot"
arch=('x86_64')
url="https://codeberg.org/caskstrength/xtatusbar"
license=('MIT')
depends=('libpulse' 'xorg-xsetroot')
makedepends=('git' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('5c41ffb209f3837ae64a0fae89c005d4ffc0d16f350bf5fa1f7ed6d7956d8a5c4dea0a24f2b6c5f455e297573bc6602a14e0b3b852ff2becc5bc16c0e39d0ab0')

build() {
  cd "$pkgname"
  gcc -Wall -O2 -std=c23 -D_POSIX_C_SOURCE=200809L -o xtatusbar src/*.c -lpulse -lX11
}

package() {
  cd "$pkgname"

  install -Dm755 xtatusbar       "${pkgdir}/usr/bin/xtatusbar"
  install -Dm644 LICENSE         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 man/xtatusbar.1 "${pkgdir}/usr/share/man/man1/xtatusbar.1"
}
