# Maintainer: EatMyVenom <eat.my.venomm@gmail.com>

_modname=itemscroller
_mcver="1.16.4"
_url="https://masa.dy.fi/api/games/mods/minecraft/latest/client/"
pkgname=mc-itemscroller-116-fabric
pkgver="0.15.0.dev.20210108.022049"
pkgrel=1
pkgdesc="A client-side mod that adds several ways of moving items in inventory GUIs."
arch=('any')
url="https://masa.dy.fi/mcmods/client_mods/"
license=('LGPL')
makedepends=('curl' 'wget' 'jq')
# only here in case someone decides to run a single function of this
source=("manifest.json::https://masa.dy.fi/api/games/mods/minecraft/latest/client/")
sha1sums=('SKIP')

pkgver() {
  cd $srcdir
  curl -s "${url}" > manifest.json
  cat "manifest.json" | jq ".[\"mods\"][\"${_mcver}\"][\"fabric\"][\"${_modname}\"][\"version\"]" | sed 's/-/./g;s/+/./g'
}

build() {
  wget $(cat manifest.json | jq -r ".[\"mods\"][\"${_mcver}\"][\"fabric\"][\"${_modname}\"][\"url\"]")
}

package() {
  install -d -m 755 "${pkgdir}/usr/share/minecraft"

  cp $(cat manifest.json | jq -r ".[\"mods\"][\"${_mcver}\"][\"fabric\"][\"${_modname}\"][\"filename\"]") \
     "${pkgdir}/usr/share/minecraft/${_modname}-${_mcver}.jar"
}
