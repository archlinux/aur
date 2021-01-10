# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Maintainer: Martin Franc <me@martinfranc.eu>

pkgname=wob-git
pkgver=0.10+12.g22a866e04f
pkgrel=1
pkgdesc='A lightweight overlay volume/backlight/progress/anything bar for Wayland'
arch=('i686' 'x86_64')
url='https://github.com/francma/wob'
license=('ISC')
source=("git+$url")
sha512sums=('SKIP')
depends=('wayland')
makedepends=('meson' 'wayland-protocols' 'scdoc')
conflicts=('wob')
provides=("wob=${pkgver%%+*}")

pkgver() {
  git -C wob describe --abbrev=10 | sed 's/-/+/; s/-/./'
}

build() {
  arch-meson build wob \
    -D b_ndebug=true
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 wob/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
