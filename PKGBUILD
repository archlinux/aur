# Maintainer: igaurab <dev@igaurab.com>
pkgname=sidetab
pkgver=0.2.4
pkgrel=1
pkgdesc="A Contexts-style window switcher sidebar for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/igaurab/sidetab"
license=('MIT')
depends=('hyprland' 'vulkan-icd-loader' 'wayland' 'libxkbcommon' 'fontconfig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('71fd18244da35470675699d6ab66139a26126c5981f085e4a7e2c9c7e472fd18')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 assets/sidetab.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/sidetab.svg"
  install -Dm644 assets/sidetab.desktop "$pkgdir/usr/share/applications/sidetab.desktop"
}
