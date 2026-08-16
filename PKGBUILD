# Maintainer: igaurab <dev@igaurab.com>
pkgname=sidetab
pkgver=0.1.2
pkgrel=1
pkgdesc="A Contexts-style window switcher sidebar for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/igaurab/sidetab"
license=('MIT')
depends=('hyprland' 'vulkan-icd-loader' 'wayland' 'libxkbcommon' 'fontconfig')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('14dce89aef42a571c259acbcc064dda162926d351353a9489e86544db7c4a2e9')

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
