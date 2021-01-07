# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>

_modname=litematica
_mcver="1.12.2"
_modloader="liteloader"
pkgname=mc-litematica-112-liteloader
pkgver="0.0.0.dev.20200615.020552"
pkgrel=1
pkgdesc="A new schematic mod written from scratch."
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
     "${pkgdir}/usr/share/minecraft/${_modname}-${_mcver}.litemod"
}
