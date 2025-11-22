# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=rustache
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple, elegant, and lightweight CalDAV task / TODO manager (TUI & GUI)"
arch=('x86_64')
url="https://gitlab.com/trougnouf/rustache"
license=('GPL3')
depends=('fontconfig' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libxcb' 'vulkan-driver')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('e2d3ed2fab2585f4ea9c5166750ec40dd7d7204f7316c35cc57ef6438c1cd8bb')

build() {
  cd "$pkgname-v$pkgver"
  
  cargo build --release --features gui
}

package() {
  cd "$pkgname-v$pkgver"
  
  install -Dm755 "target/release/tui" "$pkgdir/usr/bin/rustache"
  install -Dm755 "target/release/gui" "$pkgdir/usr/bin/rustache-gui"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "assets/rustache.desktop" "$pkgdir/usr/share/applications/rustache.desktop"
}
