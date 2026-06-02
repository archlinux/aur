# Maintainer: Leriart <leriart@github.com>

pkgname=cava-bg
pkgver=0.2.4
pkgrel=1
pkgdesc="Audio visualizer for Wayland — background layer with dynamic wallpaper colors"
arch=('x86_64')
url="https://github.com/leriart/cava-bg"
license=('MIT')
depends=('cava' 'wayland' 'ffmpeg' 'libxkbcommon' 'libgl' 'dbus')
makedepends=('cargo' 'git')
provides=('cava-bg')
conflicts=('cava-bg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/leriart/cava-bg/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('91994bc7b7f1b022418e3a2ee19b6deb1bcddfdb1936551166c60dbb8b346d0d')

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
