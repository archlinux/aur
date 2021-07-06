# Maintainer: Kenny Levinsen <aur [at] kl [dot] wtf>

pkgname=seatd-git
pkgver=r195.2204db5531
pkgrel=1
pkgdesc="Seat management daemon and library"
arch=(x86_64)
url="https://git.sr.ht/~kennylevinsen/seatd"
license=(MIT)
source=("git+$url")
sha256sums=('SKIP')
conflicts=(seatd libseat)
provides=(seatd libseat)
depends=(systemd)
makedepends=(meson ninja scdoc)

pkgver() {
  cd seatd
  printf 'r%d.%s' \
    $(git rev-list --count HEAD) \
    $(git rev-parse HEAD | head -c10)
}

build() {
  mkdir -p build
  arch-meson seatd build -Dlibseat-logind=systemd
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
