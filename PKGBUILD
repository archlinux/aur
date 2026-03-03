# Maintainer: Omni <team@omni.dev>
pkgname=omnidotdev-terminal
pkgver=0.2.0
pkgrel=1
pkgdesc="GPU-accelerated terminal emulator built to run everywhere"
arch=('x86_64')
url="https://terminal.omni.dev"
license=('MIT')
depends=('fontconfig' 'freetype2' 'libxkbcommon' 'wayland')
makedepends=('cargo' 'cmake' 'ncurses' 'python')
source=("https://github.com/omnidotdev/terminal/archive/v$pkgver.tar.gz")

build() {
  cd "terminal-$pkgver"
  cargo build --release -p omni-terminal
}

package() {
  cd "terminal-$pkgver"
  install -Dm755 "target/release/omni-terminal" "$pkgdir/usr/bin/omni-terminal"
  install -Dm644 "misc/omni-terminal.desktop" "$pkgdir/usr/share/applications/omni-terminal.desktop"
  install -Dm644 "misc/logo.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/omni-terminal.svg"
  install -Dm644 "misc/dev.omni.Terminal.metainfo.xml" "$pkgdir/usr/share/metainfo/dev.omni.Terminal.metainfo.xml"
  tic -sx -o "$pkgdir/usr/share/terminfo" "misc/omni-terminal.terminfo"
  install -Dm644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "NOTICE.md" "$pkgdir/usr/share/doc/$pkgname/NOTICE"
}
sha256sums=('42ca5d5fc3324903937dd7c55bec52093b036e3cba2735375a6fed4839c608d9')
