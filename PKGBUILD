# Maintainer: Your Name <your@email.com>
# Contributor: Your Name <your@email.com>

pkgname=markup-swift
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimal, fast markdown editor with live preview"
arch=('x86_64' 'aarch64')
url="https://github.com/yourusername/Markup"
license=('custom:CC-BY-NC-SA')
depends=(
  gtk3
  libxcb
  libxkbcommon
  wayland
  fontconfig
)
makedepends=(
  cargo
  rust
)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  RUSTFLAGS="-C link-arg=-s" cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/$pkgname -t "$pkgdir/usr/bin"
  install -Dm644 resources/$pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 resources/$pkgname.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
