# Maintainer: Da4ndo <contact@da4ndo.com>

pkgname=hyprproxlock-git
pkgver=0.1.1.r8.gfa86c66
pkgrel=1
pkgdesc="A proximity-based daemon for Hyprland that triggers screen locking and unlocking through hyprlock based on Bluetooth device proximity. (Git version)"
arch=(x86_64)
license=(BSD)
url="https://github.com/Da4ndo/hyprproxlock"
provides=('hyprproxlock')
conflicts=('hyprproxlock')
depends=('rust' 'cargo' 'bluez-deprecated-tools' 'hyprlock>=0')
makedepends=('git' 'pkg-config' 'dbus')
source=("git+https://github.com/Da4ndo/hyprproxlock.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/hyprproxlock"
  cargo build --release
}

pkgver() {
  cd "$srcdir/hyprproxlock"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/hyprproxlock"
  install -Dm755 "target/release/hyprproxlock" "$pkgdir/usr/bin/hyprproxlock"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/hyprproxlock-git/LICENSE"
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/hyprproxlock-git/README.md"
} 