pkgname=zap-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Minimal wrapper for WhatsApp Web (Tauri)"
arch=('x86_64')
url="https://github.com/JonasAlv/zap-rs"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libsoup' 'openssl' 'libayatana-appindicator')
makedepends=('rust' 'cargo' 'cargo-tauri' 'git')
source=("$pkgname::git+https://github.com/JonasAlv/zap-rs.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname/src-tauri"
  cargo tauri build
}

package() {
  cd "$srcdir/$pkgname/src-tauri"
  install -Dm755 "target/release/zap-rs" "$pkgdir/usr/bin/zap-rs"

  # Optional: install desktop integration files if present
  install -Dm644 ../dist/linux/zap-rs.desktop "$pkgdir/usr/share/applications/zap-rs.desktop" || true
  install -Dm644 ../dist/linux/icons/**.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/zap-rs.png" || true
}
