# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=pantheon-screencast
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple screencast recorder designed for elementary OS"
arch=(x86_64)
url="https://github.com/artemanufrij/screencast"
license=(GPL3)
depends=(granite gst-plugins-bad libappindicator-gtk3 libwnck3)
makedepends=(git meson vala)
source=("https://github.com/artemanufrij/screencast/archive/$pkgver/screencast-$pkgver.tar.gz")
sha256sums=('da91a12014f8ccab42596f52b357d4516f85b4c05e4cef0348931a775d3c1c2d')

prepare() {
  cd screencast-$pkgver
}

build() {
  arch-meson screencast-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
