# Maintainer: Michael Langer <laminarlade at t-online DOT de>
pkgname=gradia
pkgver=1.4.0
pkgrel=1
pkgdesc="Make your screenshots ready for the world."
arch=(x86_64)
url="https://github.com/AlexanderVanhee/Gradia"
license=(GPL3)
depends=(python python-gobject python-pillow)
makedepends=(meson blueprint-compiler)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1ebe515af9feb73a672af11d07dc532e1ebac52a33d6a05b8bdea96f0ba5e761')

prepare() {
  mv Gradia-$pkgver $pkgname-$pkgver
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
