# Maintainer: zefarie <zefarie@users.noreply.github.com>
pkgname=flux-explorer
pkgver=0.2.0
pkgrel=1
pkgdesc="Lightweight file explorer built with Tauri v2 and Rust for Linux"
arch=('x86_64')
url="https://github.com/zefarie/flux-explorer"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'ffmpeg' 'poppler')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'pkgconf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/zefarie/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  npm install
  npx tauri build --bundles none
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "flux-explorer.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "src-tauri/icons/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
  for size in 32 128 256 512; do
    install -Dm644 "src-tauri/icons/${size}x${size}.png" \
      "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$pkgname.png"
  done
}
