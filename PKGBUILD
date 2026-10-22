# Maintainer: Henriklmao
pkgname=display-tui
pkgver=0.9.8
pkgrel=1
pkgdesc="Minimalistic Hyprland monitor configuration TUI"
arch=('x86_64')
url="https://github.com/Henriklmao/display-tui"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
provides=('display-tui')
conflicts=('display-tui-bin' 'display-tui-git')
makedepends=('cargo')
options=('!lto')
source=("0.9.8.tar.gz::https://github.com/Henriklmao/display-tui/archive/refs/tags/v0.9.8.tar.gz")
sha256sums=('74a9f5fa31c14a4db6a8bbe5df49fe9b74f4e67df77fca0020c210e9a77b5ff4')

prepare() {
  cd "display-tui-0.9.8"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked
}

build() {
  cd "display-tui-0.9.8"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  cd "display-tui-0.9.8"
  install -Dm755 target/release/display-tui "${pkgdir}/usr/bin/display-tui"
  install -Dm644 assets/display-tui.desktop "${pkgdir}/usr/share/applications/display-tui.desktop"
  install -Dm644 assets/desktop-icon.png "${pkgdir}/usr/share/pixmaps/display-tui.png"
}
