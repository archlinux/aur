# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=cfait
pkgver=0.1.9
pkgrel=1
pkgdesc="A simple, elegant, and lightweight CalDAV task / TODO manager (TUI & GUI)"
arch=('x86_64')
url="https://github.com/trougnouf/cfait"
license=('GPL3')
depends=('fontconfig' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libxcb' 'vulkan-driver')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
# Use SKIP in git. CI will replace this with the real hash.
sha256sums=('39fc984f688087230ca8ebc7f1caae0fcbe313386d70573ce70407ff5e1e7cc2')
replaces=('rustycal' 'rustache' 'fairouille')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --features gui
}

package() {
  cd "$pkgname-$pkgver"
  
  install -Dm755 "target/release/cfait" "$pkgdir/usr/bin/cfait"
  install -Dm755 "target/release/gui" "$pkgdir/usr/bin/cfait-gui"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "assets/cfait.desktop" "$pkgdir/usr/share/applications/cfait.desktop"
  install -Dm644 "assets/cfait.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/cfait.svg"
}
