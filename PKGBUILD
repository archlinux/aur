# Maintainer: Javier Orfo <javierorfo@protonmail.com>
#
pkgname=xtatusbar
pkgver=0.1.0
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot"
arch=('x86_64')
url="https://codeberg.org/caskstrength/xtatusbar"
license=('MIT')
depends=('alsa-lib' 'xorg-xsetroot')
makedepends=('git' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('5bc8e48ac05d8033f06643dd43eb76a8e87c177487e6ce31b619af60f408b82623f3af79cf447e6621f0027e3ffaaf79e4bff1e8723811b7b047ac7f962f6497')

build() {
  cd "$pkgname"
  gcc -Wall -O2 -std=c23 -D_POSIX_C_SOURCE=200809L -o xtatusbar src/*.c -lasound -lX11
}

package() {
  cd "$pkgname"

  install -Dm755 xtatusbar       "${pkgdir}/usr/bin/xtatusbar"
  install -Dm644 LICENSE         "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 man/xtatusbar.1 "${pkgdir}/usr/share/man/man1/xtatusbar.1"
}
