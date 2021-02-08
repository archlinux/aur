# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=seatd
pkgver=0.4.0
pkgrel=1
pkgdesc="Seat management daemon and library"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/seatd"
license=(MIT)
source=("https://git.sr.ht/~kennylevinsen/seatd/archive/$pkgver.tar.gz")
sha256sums=('8c21541303d07c2fb7df4383451f109b3fa7ca06f3388b3a5918dbf5552b7d1b')
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
