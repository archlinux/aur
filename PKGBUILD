# Maintainer: Rizzzi Git <rizzzigit@gmail.com>

tmlver="2023.06.25.36"
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
  "aa3cb650849726612c433dd66bb3bf9bfe08c792c382e1490a57f4689ba8dbb1"
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
