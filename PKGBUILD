# Maintainer: Henriklmao
pkgname=display-tui
pkgver=0.9.6.3
pkgrel=1
pkgdesc="Minimalistic Hyprland monitor configuration TUI"
arch=('x86_64')
url="https://github.com/Henriklmao/display-tui"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
provides=('display-tui')
makedepends=('cargo')
options=('!lto')
source=("0.9.6-3.tar.gz::https://github.com/Henriklmao/display-tui/archive/refs/tags/v0.9.6-3.tar.gz")
sha256sums=('afda7845bfa354385e1040d3c74b13103a2ba9e132d19002e103cc3dfbbe87f5')

prepare() {
  cd "display-tui-0.9.6-3"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "display-tui-0.9.6-3"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  cd "display-tui-0.9.6-3"
  install -Dm755 target/release/display-tui "${pkgdir}/usr/bin/display-tui"
  install -Dm644 assets/display-tui.desktop "${pkgdir}/usr/share/applications/display-tui.desktop"
  install -Dm644 assets/desktop-icon.png "${pkgdir}/usr/share/pixmaps/display-tui.png"
}
