# Maintainer: Your Name <javierorfo@protonmail.com>
#
pkgname=xtatusbar
pkgver=0.3.0
pkgrel=1
pkgdesc="Configurable statusbar for Xorg server using xsetroot"
arch=('x86_64')
url="https://github.com/javiorfo/xtatusbar"
license=('MIT')
depends=('alsa-lib' 'xorg-xsetroot')
makedepends=('git' 'gcc')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('fd150d028c278fbe2d5757d78dc5022c485a38d0476f448abed7bdf3a62637149bbedaab2737cb08256aa91db54755d5ba68770c28c3930d2c535536c5a1dcc9')

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
