pkgname=rustpad
pkgver=0.1.3
pkgrel=1
pkgdesc="A lightweight Notepad style editor built with Rust and Iced"
arch=('x86_64' 'aarch64')
url="https://github.com/goshitsarch-eng/RustPad"
license=('custom:none')
depends=('gtk3' 'hicolor-icon-theme')
makedepends=('cargo' 'pkgconf')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/goshitsarch-eng/RustPad/archive/refs/tags/v$pkgver.tar.gz"
  "rustpad.desktop"
)
sha256sums=(
  '546adf39558c13fe937c8c4ed264a88ffa480197d21cc60eff9d3debd289c0ff'
  '1dbac82ec22c97895b3cb76fa7b335c4974c17c49f286294de35ec057f404f73'
)

_srcdir="RustPad-$pkgver"

prepare() {
  cd "$srcdir/$_srcdir"
  cargo fetch --locked
}

build() {
  cd "$srcdir/$_srcdir"
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$_srcdir"

  install -Dm755 "target/release/rustpad" "$pkgdir/usr/bin/rustpad"
  install -Dm644 "$srcdir/rustpad.desktop" \
    "$pkgdir/usr/share/applications/rustpad.desktop"
  install -Dm644 "assets/rustpad-icon.png" \
    "$pkgdir/usr/share/icons/hicolor/256x256/apps/rustpad.png"
}
