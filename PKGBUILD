# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=seatd
pkgver=0.6.0
pkgrel=1
pkgdesc="Seat management daemon and library"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/seatd"
license=(MIT)
source=("https://git.sr.ht/~kennylevinsen/seatd/archive/$pkgver.tar.gz")
sha256sums=('568f170c5a25b3f57366479275421004cc5c8bddc17b0d7e78a7527fafa9766a')
conflicts=(seatd libseat)
provides=(seatd libseat)
depends=(systemd)
makedepends=(meson ninja scdoc)

build() {
  mkdir -p build
  arch-meson seatd-$pkgver build -Dlibseat-logind=systemd
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
