# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=seatd
pkgver=0.2.0
pkgrel=1
pkgdesc="Seat management daemon and library"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/seatd"
license=(MIT)
source=("https://git.sr.ht/~kennylevinsen/seatd/archive/$pkgver.tar.gz")
sha256sums=('6b0160fa2f0500da7db6450547b8ffa7063d063dc94a4a2a710f416b2e41699f')
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
