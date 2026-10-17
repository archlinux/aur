# Maintainer: Henriklmao
pkgname=display-tui
pkgver=0.9.6
pkgrel=4
pkgdesc="Minimalistic Hyprland monitor configuration TUI"
arch=('x86_64')
url="https://github.com/Henriklmao/display-tui"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
provides=('display-tui')
makedepends=('cargo')
options=('!lto')
source=("0.9.6-4.tar.gz::https://github.com/Henriklmao/display-tui/archive/refs/tags/v0.9.6-4.tar.gz")
sha256sums=('53fba34974c323ba8efabd1b35b30cb57aa057c92d9fe970840282c7be7740eb')

prepare() {
  cd "display-tui-0.9.6-4"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "display-tui-0.9.6-4"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  cd "display-tui-0.9.6-4"
  install -Dm755 target/release/display-tui "${pkgdir}/usr/bin/display-tui"
  install -Dm644 assets/display-tui.desktop "${pkgdir}/usr/share/applications/display-tui.desktop"
  install -Dm644 assets/desktop-icon.png "${pkgdir}/usr/share/pixmaps/display-tui.png"
}
