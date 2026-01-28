# Maintainer: Benoit Brummer (Trougnouf) <trougnouf@gmail.com>
pkgname=cfait
pkgver=0.4.9
pkgrel=1
pkgdesc="Powerful, fast and elegant task / TODO manager. (GUI & TUI, CalDAV & local)"
arch=('x86_64')
url="https://codeberg.org/trougnouf/cfait"
license=('GPL3')
depends=('fontconfig' 'libx11' 'libxcursor' 'libxi' 'libxrandr' 'libxcb' 'vulkan-driver')
makedepends=('cargo')
options=('!lto' '!strip' '!debug')
source=("cfait-source-v0.4.9.tar.gz::https://codeberg.org/trougnouf/cfait/releases/download/v0.4.9/cfait-source-v0.4.9.tar.gz")
sha256sums=('0fc0f51c0ab290866da019cddcd5b2ef5e726476751683c434641394fae57041')
replaces=('rustycal' 'rustache' 'fairouille')
provides=('cfait-tui' 'cfait-gui')

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
