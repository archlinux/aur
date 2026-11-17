# Maintainer: javy

pkgname=xtatusbar
pkgver=0.2.0
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
sha512sums=('83c1be5c39049bba101f1f85d5837b3ecbb9c667f673d2fdb46c0c0f3bc63143c8b3a6c99699a284d92e0161aed5e433ce75c7dc64f4ada1f368888d69165cb8')

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
