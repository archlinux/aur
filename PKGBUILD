# Maintainer: Henriklmao
pkgname=display-tui
pkgver=0.9.7
pkgrel=1
pkgdesc="Minimalistic Hyprland monitor configuration TUI"
arch=('x86_64')
url="https://github.com/Henriklmao/display-tui"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
provides=('display-tui')
makedepends=('cargo')
options=('!lto')
source=("0.9.7.tar.gz::https://github.com/Henriklmao/display-tui/archive/refs/tags/v0.9.7.tar.gz")
sha256sums=('57374e4a6dd54508f4f53cb46f19c679e47f0a5dc72a231fa0c9254c2b592254')

prepare() {
  cd "display-tui-0.9.7"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "display-tui-0.9.7"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  cd "display-tui-0.9.7"
  install -Dm755 target/release/display-tui "${pkgdir}/usr/bin/display-tui"
  install -Dm644 assets/display-tui.desktop "${pkgdir}/usr/share/applications/display-tui.desktop"
  install -Dm644 assets/desktop-icon.png "${pkgdir}/usr/share/pixmaps/display-tui.png"
}
