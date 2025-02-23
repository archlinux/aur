# Maintainer: Diablo (https://github.com/progzone122) (https://t.me/DiabloSat)
pkgname=warp-gui
pkgver=0.3.0
pkgrel=3
pkgdesc="A GUI application based on warp-cli for linux written in Rust"
arch=('x86_64')
url="https://github.com/progzone122/warp-cloudflare-gui-rust"
options=(!lto !strip)
license=('GPL-3.0-or-later')
depends=(
  'pacman>6.1'
  'cloudflare-warp-bin'
  'gtk3'
  'webkit2gtk-4.1'
)
optdepends=(
  'sudo: privilege elevation'
  'doas: privilege elevation'
)
makedepends=()
source=(
  "https://github.com/progzone122/warp-cloudflare-gui-rust/releases/download/$pkgver/warp-gui.deb"
)
sha256sums=('5beca64e4dacb0b3937d443625c7ca993ceb4f6dacd0155e7e8e947e437ae87a')
build() {
  :
}

package() {
  mkdir -p "$srcdir/data"

  bsdtar -xf "$srcdir/data.tar.gz" -C "$srcdir/data"

  if [ -d "$srcdir/data/usr" ]; then
    cp -r "$srcdir/data/usr" "$pkgdir/"
  elif [ -d "$srcdir/data/opt" ]; then
    cp -r "$srcdir/data/opt" "$pkgdir/"
  else
    echo "ERROR: Invalid structure data.tar.gz" >&2
    return 1
  fi

  chmod -R 755 "$pkgdir/"
}

post_install() {
  echo "To enable the warp-svc service, run the following command:"
  echo "sudo systemctl enable warp-svc.service --now"
  echo "And then type in:"
  echo "warp-cli registration new"
}
