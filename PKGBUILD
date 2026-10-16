# Maintainer: Henriklmao
pkgname=display-tui
pkgver=0.9.6.2
pkgrel=1
pkgdesc="Minimalistic Hyprland monitor configuration TUI"
arch=('x86_64')
url="https://github.com/Henriklmao/display-tui"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("0.9.6-2.tar.gz::https://github.com/Henriklmao/display-tui/archive/refs/tags/v0.9.6-2.tar.gz")
sha256sums=('35289dc5300160b92b74a7c9fce09a25696acac1f9b50e99e5605aa14c5c5944')

prepare() {
  cd "display-tui-0.9.6-2"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "display-tui-0.9.6-2"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  cd "display-tui-0.9.6-2"
  install -Dm755 target/release/display-tui "${pkgdir}/usr/bin/display-tui"
  install -Dm644 assets/display-tui.desktop "${pkgdir}/usr/share/applications/display-tui.desktop"
  install -Dm644 assets/desktop-icon.png "${pkgdir}/usr/share/pixmaps/display-tui.png"
}
