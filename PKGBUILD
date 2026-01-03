# Maintainer: mirlili <mirlizz1337@gmail.com>
pkgname=chess-native
pkgver=1.0.0
pkgrel=1
pkgdesc="Lightweight Chess.com desktop client built with Tauri"
arch=('x86_64')
url="https://github.com/mirlili/chess"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3')
makedepends=('cargo' 'npm')
source=("git+${url}.git")
sha256sums=('SKIP')
options=('!debug' '!strip')
prepare() {
  cd "chess"
  mkdir -p empty-dist
}

build() {
  cd "$srcdir/chess/src-tauri"
  cargo tauri build --no-bundle
}

package() {
  cd "chess"
  install -Dm755 "src-tauri/target/release/app" "${pkgdir}/usr/bin/chess-native"
  
  install -Dm644 "src-tauri/icons/128x128.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/chess-native.png"

  mkdir -p "${pkgdir}/usr/share/applications"
  echo "[Desktop Entry]
Name=Chess Native
Exec=chess-native
Icon=chess-native
Type=Application
Categories=Game;BoardGame;
Terminal=false" > "${pkgdir}/usr/share/applications/chess-native.desktop"
}
