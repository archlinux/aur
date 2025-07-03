# Maintainer: Lncvrt <lncvrtreal@gmail.com>

pkgname=berrydash
pkgver=1.5.2
pkgrel=1
pkgdesc="A simple game where you catch berries with a leaderboard system and more."
arch=('x86_64')
url="https://berrydash.lncvrt.xyz/"
license=('GPL3')
depends=()
makedepends=('unzip')
options=(!strip !debug)
source=(
  "https://github.com/BerryDash/source/releases/download/$pkgver/Berry-Dash-$pkgver-linux.zip"
  "berrydash.desktop"
  "berrydash.png"
)
sha256sums=(
  '702d1c46c69724528797ea46d5279fb260e1c2b8fb64a5c75a2112926ebe2d30'
  'a27dae1b8f41d289c04ce9ede426e4938be5ba882cd51d57fee35718ecea2829'
  'eac907c8d88390f89d7c1ed56532781c78b750faad07664e1967d8634593a383'
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
