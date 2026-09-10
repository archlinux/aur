pkgname=aercast
pkgver=0.1.5
pkgrel=1
pkgdesc='Native Linux/Wayland screen sharing over HTTP'
arch=('x86_64')
url='https://github.com/Xarth-Mai/Aercast'
license=('MPL-2.0')
depends=(
  'gst-libav'
  'gst-plugin-pipewire'
  'gst-plugin-va'
  'gst-plugins-bad-libs'
  'gst-plugins-base-libs'
  'gst-plugins-good'
  'gst-plugins-ugly'
  'gstreamer'
  'libpipewire'
  'libxkbcommon'
  'vulkan-icd-loader'
  'wayland'
  'xdg-desktop-portal'
)
makedepends=('cargo' 'clang' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dcc436eda0b10e970b271b06b3a60c25abfd80859cd726de2725d5348d4c43cb')

prepare() {
  cd "Aercast-$pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "Aercast-$pkgver"
  cargo build --frozen --release
}

check() {
  cd "Aercast-$pkgver"
  cargo test --frozen
}

package() {
  cd "Aercast-$pkgver"
  install -Dm755 target/release/aercast "$pkgdir/usr/bin/aercast"
  install -Dm644 assets/aercast-icon.png "$pkgdir/usr/share/pixmaps/aercast.png"
  install -Dm644 assets/aercast.desktop "$pkgdir/usr/share/applications/aercast.desktop"
}
