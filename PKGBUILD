# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=seatd
pkgver=0.5.0
pkgrel=1
pkgdesc="Seat management daemon and library"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/seatd"
license=(MIT)
source=("https://git.sr.ht/~kennylevinsen/seatd/archive/$pkgver.tar.gz")
sha256sums=('274b56324fc81ca6002bc1cdd387668dee34a6e1063e5f3896805c3770948988')
conflicts=(seatd libseat)
provides=(seatd libseat)
depends=(systemd)
makedepends=(meson ninja scdoc)

build() {
  mkdir -p build
  arch-meson seatd-$pkgver build -Dlogind=enabled
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
