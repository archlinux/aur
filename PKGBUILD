# Maintainer: Rizzzi Git <rizzzigit@gmail.com>

tmlver="2023.08.3.0"
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
  "7de7dc333152964e09074f87d4bbf7d28c8ed1fd40fb76a329e5d8e9cfc637a9"
)

noextract=("tml-$tmlver.zip")

package() {
  rootdir="$pkgdir/opt/tModLoader"
  bindir="$pkgdir/usr/bin"
  packfile="$rootdir/tml.zip"

  if [[ ! -e $rootdir ]]
  then
    mkdir -p "$rootdir"
  fi

  cp "tml-$tmlver.zip" "$packfile"
  echo "$tmlver" > "$rootdir/ver.txt"

  if [[ ! -e $bindir ]]
  then
    mkdir -p "$bindir"
  fi

  ln -s "/opt/tModLoader/tmodloader.sh" "$bindir/tmodloader"
  ln -s "/opt/tModLoader/tmodloader-server.sh" "$bindir/tmodloader-server"
  ln -s "/opt/tModLoader/tmodloader-familyshare.sh" "$bindir/tmodloader-familyshare"

  cp "$startdir/"*".sh" -rp "$rootdir/"
  chmod 755 "$rootdir/"*".sh"
}
