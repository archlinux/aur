# Maintainer: Gxstavo <gps5821s@outlook.com>
# Contributor: Gxstavo <gps5821s@outlook.com>
pkgname=spent-tracker
pkgver=0.1.0
pkgrel=1
pkgdesc="A personal expense tracker desktop app built with Tauri"
arch=('x86_64')
url="https://github.com/Gxstavo-dev/spent"
license=('MIT')
options=('!strip')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libsoup3'
  'cairo'
  'gdk-pixbuf2'
  'glib2'
  'pango'
  'gcc-libs'
)
makedepends=('cargo' 'bun')
source=("spent-$pkgver.tar.gz::https://github.com/Gxstavo-dev/spent/archive/v$pkgver.tar.gz")
sha256sums=('fae0f66a256b7af36112db7cbbeba8e2c29ce907b417e6d679fe574e311ffd74')

build() {
  cd "$srcdir/spent-$pkgver"
  bun install
  bunx tauri build
}

package() {
  cd "$srcdir/spent-$pkgver/src-tauri/target/release"
  install -Dm755 "spent" "$pkgdir/usr/bin/spent"
  install -Dm755 "servidor" "$pkgdir/usr/bin/servidor"
  install -Dm644 "$srcdir/spent-$pkgver/src-tauri/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/spent.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/spent.desktop" <<EOF
[Desktop Entry]
Categories=Finance;Utility;
Comment=A personal expense tracker
Exec=spent
StartupWMClass=spent
Icon=spent
Name=spent
Terminal=false
Type=Application
EOF
}
