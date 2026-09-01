# Maintainer: Rizzzi Git <rizzzigit@gmail.com>

tmlver="2026.07.3.0"
terrariaver="1.4.5.8"
pkgrel=1
epoch=0

pkgname="tmodloader-bin"
pkgdesc="An open-source, community-driven, modification and expansion of the Terraria game that makes it possible to make and play mods."
pkgver="$tmlver"_"$terrariaver"
url="https://www.tmodloader.net/"
arch=("x86_64")
license=("MIT")
depends=('unzip>=6.0')

source=(
  "tml-$tmlver.zip::https://github.com/tModLoader/tModLoader/releases/download/v$tmlver/tModLoader.zip"
  "tml-$tmlver-LICENSE"::"https://raw.githubusercontent.com/tModLoader/tModLoader/666f69962d3bdffde54fc14025f02634965b4e7c/LICENSE"
)

sha256sums=(
  "6f51610f4b0f167d1620d0e8c83264ba14e047421e97d9f8053eb40e3d764e1a"
  "472279759f98a8e7c220321257ffdd181c99072e46a36ad673cd82e776636066"
)

noextract=("tml-$tmlver.zip")

prepare() {
  rm -rf "${pkgdir:?}/${pkgname:?}"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/tModLoader/tmodloader.sh" "$pkgdir/usr/bin/tmodloader"
  ln -s "/opt/tModLoader/tmodloader-server.sh" "$pkgdir/usr/bin/tmodloader-server"
  ln -s "/opt/tModLoader/tmodloader-familyshare.sh" "$pkgdir/usr/bin/tmodloader-familyshare"

  install -Dm444 "tml-$tmlver.zip" "$pkgdir/opt/tModLoader/tml.zip"
  install -Dm555 -t "$pkgdir/opt/tModLoader" "$startdir"/*.sh
  install -Dm444 -t "$pkgdir/usr/share/licenses/$pkgname" "$startdir/tml-$tmlver-LICENSE"
  echo "$tmlver" | install -Dm444 "/dev/stdin" "$pkgdir/opt/tModLoader/ver.txt"
}
