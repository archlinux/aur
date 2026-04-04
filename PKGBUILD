# Maintainer: Reasonance team
pkgname=reasonance
pkgver=3.2.0
pkgrel=1
pkgdesc='Lightweight IDE for vibecoders who work with LLMs'
arch=('x86_64')
url='https://github.com/TNASRLSB/reasonance'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3')
makedepends=('rust' 'cargo' 'nodejs' 'npm' 'patchelf')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  npm install
  npx tauri build --no-bundle
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "reasonance.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install normalizer configs (CLI provider definitions)
  install -d "$pkgdir/usr/share/$pkgname/normalizers"
  install -Dm644 src-tauri/normalizers/*.toml -t "$pkgdir/usr/share/$pkgname/normalizers/"

  # Install icons for desktop environment integration
  install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
  install -Dm644 "src-tauri/icons/64x64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/$pkgname.png"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 "src-tauri/icons/128x128@2x.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
  install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
}
