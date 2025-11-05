
pkgname=brisq
pkgver=0.1.0
pkgrel=1
pkgdesc="A Focus App to Help You Stay on Track"
arch=('x86_64')
url="https://github.com/DeepanshuMishraa/brisk"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'librsvg')
makedepends=('rust' 'cargo' 'nodejs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/heads/master.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/brisk-master"

  # Install JS deps
  pnpm install

  # Build only the Tauri *binary* (bundling disabled in config)
  pnpm tauri build
}

package() {
  cd "$srcdir/brisk-master"

  # Install binary
  install -Dm755 "src-tauri/target/release/brisq" \
    "$pkgdir/usr/bin/brisq"

  # Install desktop entry (from AUR repo)
  install -Dm644 "$startdir/brisq.desktop" \
    "$pkgdir/usr/share/applications/brisq.desktop"

  # Install icon (from AUR repo)
  install -Dm644 "$startdir/brisq.png" \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/brisq.png"
}
