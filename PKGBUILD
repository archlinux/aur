# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=warp-gui
pkgver=0.2.0
pkgrel=4
pkgdesc="A GUI application based on warp-cli for linux written in Rust"
arch=('x86_64')
url="https://github.com/progzone122/warp-cloudflare-gui-rust"
options=(!lto !strip)
license=('GPL-3.0-or-later')
depends=(
  'pacman>6.1'
  'cloudflare-warp-bin'
  'qt6-base'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=()
source=(
  "https://github.com/progzone122/warp-cloudflare-gui-rust/releases/download/$pkgver/warp-gui"
  "https://raw.githubusercontent.com/progzone122/warp-cloudflare-gui-rust/main/warp-gui.desktop"
)
sha256sums=('3aaff1ea4eeb6aa1ee02e8a03ec914d1d0a2ceb8abc7e72d8f253ed99cbf2566'
            'dbf7470f5ecb686e6ab83f95ffa4ae24736572a7982bf09a61ffabd3580aacec')
build() {
  :
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -Dm755 "$srcdir/warp-gui" "$pkgdir/usr/bin/warp-gui"
  chmod +x "$pkgdir/usr/bin/warp-gui"

  mkdir -p "$pkgdir/usr/share/applications"
  install -Dm644 "$srcdir/warp-gui.desktop" "$pkgdir/usr/share/applications/warp-gui.desktop"
}

post_install() {
  echo "To enable the warp-svc service, run the following command:"
  echo "sudo systemctl enable warp-svc.service --now"
  echo "And then type in:"
  echo "warp-cli registration new"
}
