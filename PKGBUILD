# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=fairouille
pkgver=0.1.4
pkgrel=1
pkgdesc="A simple, elegant, and lightweight CalDAV task / TODO manager (TUI & GUI)"
arch=('x86_64')
url="https://gitlab.com/trougnouf/fairouille"
license=('GPL3')
depends=('fontconfig' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libxcb' 'vulkan-driver')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('6026bb44719abda562dfd8cc5406f77dfd18e2e84ef7362f0bd2a38d7c9f0fc4')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --release --features gui
}

package() {
  cd "$pkgname-v$pkgver"
  
  install -Dm755 "target/release/fairouille" "$pkgdir/usr/bin/fairouille"
  install -Dm755 "target/release/gui" "$pkgdir/usr/bin/fairouille-gui"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "assets/fairouille.desktop" "$pkgdir/usr/share/applications/fairouille.desktop"
}
