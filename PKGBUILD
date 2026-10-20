# Maintainer: Henriklmao
pkgname=display-tui
pkgver=0.9.7
pkgrel=2
pkgdesc="Minimalistic Hyprland monitor configuration TUI"
arch=('x86_64')
url="https://github.com/Henriklmao/display-tui"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
provides=('display-tui')
conflicts=('display-tui-bin' 'display-tui-git')
makedepends=('cargo')
options=('!lto')
source=("0.9.7-2.tar.gz::https://github.com/Henriklmao/display-tui/archive/refs/tags/v0.9.7-2.tar.gz")
sha256sums=('e192f70e8235ffd15aa27cc514475034c818bf73289d266b1b741106d114a588')

prepare() {
  cd "display-tui-0.9.7-2"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "display-tui-0.9.7-2"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  cd "display-tui-0.9.7-2"
  install -Dm755 target/release/display-tui "${pkgdir}/usr/bin/display-tui"
  install -Dm644 assets/display-tui.desktop "${pkgdir}/usr/share/applications/display-tui.desktop"
  install -Dm644 assets/desktop-icon.png "${pkgdir}/usr/share/pixmaps/display-tui.png"
}
