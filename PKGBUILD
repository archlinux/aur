# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=seatd
pkgver=0.1.0
pkgrel=1
pkgdesc="Seat management daemon and library"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/seatd"
license=(MIT)
source=("https://git.sr.ht/~kennylevinsen/seatd/archive/$pkgver.tar.gz")
sha256sums=('96f38bf984ff80cc22447341e052e9edb254ec458bc0ddf0b90a6ca2d4fba858')
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
