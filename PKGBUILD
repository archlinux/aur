# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>

_modname=minihud
_mcver="1.17-snapshot-20w51a"
_modloader="fabric"
pkgname=mc-minihud-117-fabric
pkgver="0.19.0.dev.20201218.025957"
pkgrel=1
pkgdesc="A client-side mod that allows displaying various info lines on the screen "
arch=('any')
url="https://masa.dy.fi/mcmods/client_mods/"
license=('LGPL')
makedepends=('wget' 'jq')
source=("manifest.json::https://masa.dy.fi/api/games/mods/minecraft/latest/client/")
sha1sums=('SKIP')

pkgver() {
  cd $srcdir
  cat manifest.json | jq ".[\"mods\"][\"${_mcver}\"][\"${_modloader}\"][\"${_modname}\"][\"version\"]" | sed 's/-/./g;s/+/./g'
}

build() {
  wget $(cat manifest.json | jq -r ".[\"mods\"][\"${_mcver}\"][\"${_modloader}\"][\"${_modname}\"][\"url\"]")
}

package() {
  install -d -m 755 "${pkgdir}/usr/share/minecraft"

  cp $(cat manifest.json | jq -r ".[\"mods\"][\"${_mcver}\"][\"${_modloader}\"][\"${_modname}\"][\"filename\"]") \
     "${pkgdir}/usr/share/minecraft/${_modname}-${_mcver}.jar"
}
