# Maintainer: Lncvrt <lncvrtreal@gmail.com>

pkgname=berrydash
pkgver=26.1
pkgrel=1
pkgdesc="A simple game where you catch berries with a leaderboard system and more."
arch=('x86_64')
url="https://berrydash.lncvrt.xyz/"
license=('GPL3')
depends=()
makedepends=('unzip')
options=(!strip !debug)
source=(
  "https://games-r2.lncvrt.xyz/berry-dash/Berry-Dash-$pkgver-linux.zip"
  "berrydash.desktop"
  "berrydash.png"
)
sha256sums=(
  'd43ec9fd5acdfa210c674655a481343fdb9db7a60d0d0f3960ba44e433d768ca'
  'a27dae1b8f41d289c04ce9ede426e4938be5ba882cd51d57fee35718ecea2829'
  '79273f068c2ea02c96fb9ff095de6263bcea3ff0f7d3e5aa06efe2ccf5da027c'
)

prepare() {
  mkdir -p "$srcdir/game"
  bsdtar -xf "Berry-Dash-$pkgver-linux.zip" -C "$srcdir/game"
}

package() {
  install -d "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/game/." "$pkgdir/opt/$pkgname/"
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$pkgname" <<EOF
#!/bin/bash
cd /opt/$pkgname
exec ./Berry\ Dash.x86_64
EOF
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
}
