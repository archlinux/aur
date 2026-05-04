# Maintainer: Mingxun Hua: huamingxun@gmail.com
pkgname=librepods-rust-git
pkgver=r526.4a9a2e7
pkgrel=1
pkgdesc="Apple exclusive AirPods Pro features for Linux (Rust Rewrite Branch)"
arch=('x86_64')
url="https://github.com/kavishdevar/librepods"
license=('AGPL-3.0-or-later')
depends=('bluez' 'libpulse' 'dbus' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('git' 'rust' 'cargo')
provides=('librepods')
conflicts=('librepods' 'librepods-git')
source=("git+https://github.com/kavishdevar/librepods.git#branch=linux/rust")
sha256sums=('SKIP')

pkgver() {
  cd "librepods"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "librepods/linux-rust"
  cargo build --release --locked
}

package() {
  cd "librepods/linux-rust"

  # Install the main application binary
  install -Dm755 "target/release/librepods" "$pkgdir/usr/bin/librepods"

  # Install the desktop shortcut
  install -Dm644 "assets/me.kavishdevar.librepods.desktop" "$pkgdir/usr/share/applications/me.kavishdevar.librepods.desktop"

  # Install the app icon
  install -Dm644 "assets/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/me.kavishdevar.librepods.png"
}
