# Maintainer: Time ON <timeon.haas@gmail.com>
pkgname=hypr-bucket
pkgver=1.1.1
pkgrel=1
pkgdesc="Lightweight and customizable application launcher for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/Time-0N/hypr-bucket"
license=('GPL3-only')
depends=(
  'gtk4'
  'gtk4-layer-shell'
  'gcc'
  'glibc'
)
makedepends=(
  'cargo'
  'rust'
  'pkgconfig'
)
optdepends=(
  'kitty: Terminal for terminal applications'
  'alacritty: Alternative terminal'
  'wezterm: Alternative terminal'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/Time-0N/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5b96daf22d21d6d212f43057beb74573ec2051496d52e1060b5f244f00afefac')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"

  # Install binary
  install -Dm755 target/release/hbucket "$pkgdir/usr/bin/hbucket"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
