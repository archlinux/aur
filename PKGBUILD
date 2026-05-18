# Maintainer: Javier Orfo <javierorfo@protonmail.com>
#
pkgname=xtatusbar
pkgver=0.1.2
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
sha512sums=('a5559041041ba8fd3544c02f8235b95f48c0742dd411389450a15fb1673b6d2096ce58140866ab058ae47254f709a290c993a228a9ace7db2eb226ca609f16c9')

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
