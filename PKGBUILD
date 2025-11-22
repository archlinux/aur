# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=cfait
pkgver=0.1.5
pkgrel=1
pkgdesc="A simple, elegant, and lightweight CalDAV task / TODO manager (TUI & GUI)"
arch=('x86_64')
url="https://gitlab.com/trougnouf/cfait"
license=('GPL3')
depends=('fontconfig' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libxcb' 'vulkan-driver')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
# Use SKIP in git. CI will replace this with the real hash.
sha256sums=('dddc4b55b07808b3df4cb208221cda07cd9219a07999f93b7533bcda2bba9388')
replaces=('rustycal' 'rustache' 'fairouille')

build() {
  cd "$pkgname-v$pkgver"
  cargo build --release --features gui
}

package() {
  cd "$pkgname-v$pkgver"
  
  install -Dm755 "target/release/cfait" "$pkgdir/usr/bin/cfait"
  install -Dm755 "target/release/gui" "$pkgdir/usr/bin/cfait-gui"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "assets/cfait.desktop" "$pkgdir/usr/share/applications/cfait.desktop"
}