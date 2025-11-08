pkgname=brisq
pkgver=0.1.2
pkgrel=1
pkgdesc="A Focus App to Help You Stay on Track"
arch=('x86_64')
url="https://github.com/DeepanshuMishraa/brisk"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'librsvg')
makedepends=('rust' 'cargo' 'nodejs' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/brisk-$pkgver"

  # Install JS deps
  pnpm install

  # Build Tauri binary (bundling disabled)
  pnpm tauri build
}

package() {
  cd "$srcdir/brisk-$pkgver"

  # Install binary
  install -Dm755 "src-tauri/target/release/brisq" \
    "$pkgdir/usr/bin/brisq"

  # Install desktop entry
  install -Dm644 "$startdir/brisq.desktop" \
    "$pkgdir/usr/share/applications/brisq.desktop"

  # Install icon
  install -Dm644 "$startdir/brisq.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/brisq.png"
}
