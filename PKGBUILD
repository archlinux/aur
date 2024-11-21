# Maintainer: ATE

pkgname=yamli-editor
pkgver=0.1.2
pkgrel=1
pkgdesc="A native Yamli editor for Wayland"
arch=('x86_64')
url="https://github.com/ali205412/yamli-editor"
license=('MIT')
depends=('gtk3' 'webkit2gtk')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  
  # Install binary
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  
  # Install config file
  install -Dm644 "config.toml" "$pkgdir/etc/$pkgname/config.toml"
  
  # Install documentation
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install desktop file
  install -Dm644 "$srcdir/$pkgname-$pkgver/yamli-editor.desktop" "$pkgdir/usr/share/applications/yamli-editor.desktop"
}
