# Maintainer: YOUR NAME <your@email>
pkgname=papdieo
pkgver=0.1.0
pkgrel=1
pkgdesc="Hyprland-compatible wallpaper management CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/xiaotinglian/papdieo"
license=('MIT')
depends=(
  'gstreamer'
  'gst-plugins-base'
  'gst-plugins-good'
  'gst-plugins-bad'
  'gst-plugins-ugly'
  'gst-libav'
  'wayland'
  'hyprland'
)
makedepends=('git' 'cargo' 'rust')
conflicts=('papdieo-git')
source=("git+https://github.com/xiaotinglian/papdieo.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/papdieo"
  cargo build --release --locked
}

check() {
  cd "$srcdir/papdieo"
  cargo test --release --locked
}

package() {
  cd "$srcdir/papdieo"
  install -Dm755 "target/release/papdieo" "$pkgdir/usr/bin/papdieo"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
