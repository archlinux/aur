# Maintainer: Orelbi Acosta <orelbi088@gmail.com>
pkgname=swiftpeek
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightning-fast universal file previewer for Linux"
arch=('x86_64')
url="https://github.com/orelbi/swiftpeek"
license=('MIT')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
)
makedepends=(
  'rust'
  'cargo'
  'tauri-cli'
  'imagemagick'
)
optdepends=(
  'file-manager: Open files from graphical file manager'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/orelbi/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace with actual hash on release

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Build release binary
  CARGO_BUILD_JOBS=2 cargo tauri build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install binary
  install -Dm755 "src-tauri/target/release/swiftpeek" "$pkgdir/usr/bin/swiftpeek"

  # Install desktop file
  install -Dm644 "dist/swiftpeek.desktop" "$pkgdir/usr/share/applications/swiftpeek.desktop"

  # Install icons
  install -Dm644 "assets/icon.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/swiftpeek.png"
  install -Dm644 "src-tauri/icons/128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/swiftpeek.png"
  install -Dm644 "src-tauri/icons/32x32.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/swiftpeek.png"

  # Install SVG icon
  install -Dm644 "assets/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/swiftpeek.svg"

  # Install license
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Install README
  install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
