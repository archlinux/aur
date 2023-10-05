# Maintainer: Rizzzi Git <rizzzigit@gmail.com>

tmlver="2023.08.3.3"
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
  "f1850c2ddbb6c3ee7a032e4a3eea2457fd19186a2dae9cedaf733456d6d2d67f"
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

  install -Dm600 "tml-$tmlver.zip" "$packfile"
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
