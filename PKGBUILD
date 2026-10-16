# Maintainer: Henriklmao
pkgname=display-tui
pkgver=0.9.1.1
pkgrel=1
pkgdesc="Minimalistic Hyprland monitor configuration TUI"
arch=('x86_64')
url="https://github.com/Henriklmao/display-tui"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("0.9.1-1.tar.gz::https://github.com/Henriklmao/display-tui/archive/refs/tags/v0.9.1-1.tar.gz")
sha256sums=('06c53437aacce3620c4c74a478eb6cf15f1e1780f0525e893b2e5149b5aecec1')

prepare() {
  cd "display-tui-0.9.1-1"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "display-tui-0.9.1-1"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  cd "display-tui-0.9.1-1"
  install -Dm755 target/release/display-tui "${pkgdir}/usr/bin/display-tui"
  install -Dm644 assets/display-tui.desktop "${pkgdir}/usr/share/applications/display-tui.desktop"
  install -Dm644 assets/desktop-icon.png "${pkgdir}/usr/share/pixmaps/display-tui.png"
}
