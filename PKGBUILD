# Maintainer: Rizzzi Git <rizzzigit@gmail.com>

tmlver="2023.12.3.1"
terrariaver="1.4.4.9"
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
)

sha256sums=(
  "57fc5e96a0cd8999906fd7506c768032fcd025e67e97b9d7cc9d4accb59867c8"
)

noextract=("tml-$tmlver.zip")

prepare() {
  rm -rf "$pkgdir/$pkgname"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  ln -s "/opt/tModLoader/tmodloader.sh" "$pkgdir/usr/bin/tmodloader"
  ln -s "/opt/tModLoader/tmodloader-server.sh" "$pkgdir/usr/bin/tmodloader-server"
  ln -s "/opt/tModLoader/tmodloader-familyshare.sh" "$pkgdir/usr/bin/tmodloader-familyshare"

  install -Dm444 "tml-$tmlver.zip" "$pkgdir/opt/tModLoader/tml.zip"
  install -Dm555 -t "$pkgdir/opt/tModLoader" "$startdir"/*.sh
  echo "$tmlver" | install -Dm444 "/dev/stdin" "$pkgdir/opt/tModLoader/ver.txt"
}
