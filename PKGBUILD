# Maintainer: javy

pkgname=xtatusbar
pkgver=0.1.3
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot"
arch=('x86_64')
url="https://codeberg.org/javy/xtatusbar"
license=('MIT')
depends=('libpulse' 'xorg-xsetroot')
makedepends=('git' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('801c22c2a7008505478259ad5afed7a009a02e3995cc4ffcc857ea93f94d7e9b61b37db80318e1b103574bd2b681475f9d47a504628f3b9aef77f539348d8c60')

build() {
  cd "$pkgname"
  gcc -Wall -Wextra -std=c23 -pedantic -D_POSIX_C_SOURCE=200809L -o xtatusbar src/*.c -lpulse -lX11
}

package() {
  cd "$pkgname"

  install -Dm755 xtatusbar       "${pkgdir}/usr/bin/xtatusbar"
  install -Dm644 LICENSE         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 man/xtatusbar.1 "${pkgdir}/usr/share/man/man1/xtatusbar.1"
}
