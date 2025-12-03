# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=cfait
pkgver=0.2.4
pkgrel=1
pkgdesc="A powerful, simple, elegant, and lightweight CalDAV tasks / TODO manager (TUI & GUI)"
arch=('x86_64')
url="https://codeberg.org/trougnouf/cfait"
license=('GPL3')
depends=('fontconfig' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libxcb' 'vulkan-driver')
makedepends=('cargo')
options=('!lto')
source=("cfait-source-v0.2.4.tar.gz::https://codeberg.org/trougnouf/cfait/releases/download/v0.2.4/cfait-source-v0.2.4.tar.gz")
sha256sums=('92ff182a42db71ed14d7fdd9a1074e3f11ef77eaf852d4ab0a34664120281757')
replaces=('rustycal' 'rustache' 'fairouille')

build() {
  cd "$pkgname-$pkgver"
  # Set the target directory to be at the root of the makepkg build area
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --features gui
}

package() {
  cd "$pkgname-$pkgver"
  
  install -Dm755 "$srcdir/target/release/cfait" "$pkgdir/usr/bin/cfait"
  install -Dm755 "$srcdir/target/release/gui" "$pkgdir/usr/bin/cfait-gui"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "assets/cfait.desktop" "$pkgdir/usr/share/applications/cfait.desktop"
  install -Dm644 "assets/cfait.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/cfait.svg"
}