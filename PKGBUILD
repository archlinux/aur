# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=warp-gui
pkgver=0.0.1
pkgrel=3
pkgdesc="A GUI application based on warp-cli for linux written in Rust"
arch=('x86_64')
url="https://github.com/progzone122/warp-cloudflare-gui-rust"
options=(!lto)
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
  "https://raw.githubusercontent.com/progzone122/warp-cloudflare-gui-rust/main/ui/images/watermark.png"
)
sha256sums=('e06d73737e78951ad66fad41ef9866426598883710aba7eb52641005678b1998'
            '43b1b01c4dbc2d93f964b9353c7df29e484d99305a00321697edce3440d9232b'
            '8f61f1a40bffe5494c6333cb864d44b15b333a8c629d5b3aaec0f9aa9142b802')
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
