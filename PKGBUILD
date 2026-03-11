# Maintainer: ewgsta <ewgst@proton.me>
pkgname=weeb-gui
pkgver=0.1.1
pkgrel=1
pkgdesc="Tauri GUI for Weeb CLI"
arch=('x86_64')
url="https://github.com/ewgsta/weeb-gui"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'openssl' 'librsvg')
makedepends=('npm' 'rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ewgsta/weeb-gui/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$pkgname-$pkgver"
  npm install
  npm run tauri build -- --bundles deb
}

package() {
  cd "$pkgname-$pkgver"
  # Tauri builds the binary in target/release/
  install -Dm755 "src-tauri/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"

  # Desktop file and Icons (Adjust if you have specific ones)
  # install -Dm644 "src-tauri/icons/icon.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
