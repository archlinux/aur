# Maintainer: pantarune

pkgname=niri-screenshare
pkgver=0.1.0
pkgrel=2
pkgdesc="Portal backend for niri implementing ScreenCast"
arch=('x86_64')
url="https://github.com/pantarune/niri-screenshare"
license=('GPL3')
depends=(
  'xdg-desktop-portal'
  'pipewire'
  'niri'
)
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pantarune/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --frozen
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_TARGET_DIR="$srcdir/target"

  install -Dm755 "$CARGO_TARGET_DIR/release/niri-screenshare" "$pkgdir/usr/lib/niri-screenshare"
  install -Dm644 data/niri.portal "$pkgdir/usr/share/xdg-desktop-portal/portals/niri.portal"
  install -Dm644 data/org.freedesktop.impl.portal.desktop.niri.service \
    "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.niri.service"
  install -Dm644 data/niri-screenshare.service \
    "$pkgdir/usr/lib/systemd/user/niri-screenshare.service"
}
