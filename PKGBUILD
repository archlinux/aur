# Maintainer: zer0def <zer0def on freenode>
pkgname=doom-remake-4-experimental
pkgver=1.16
pkgrel=1
pkgdesc="Doom Remake 4 Experimental via the GzDoom engine."
arch=('any')
url="https://www.moddb.com/mods/lowpoly-doom-lite-10"
license=('custom')
depends=('gzdoom')
makedepends=('curl' 'tidy' 'xmlstarlet' 'unrar')
source=(
  "Doom_Remake_4_experimental_${pkgver}.rar::https://www.moddb.com/downloads/start/177776"
  'gzdoom.ini'
  'doom-remake-4-experimental'
)
sha512sums=(
  'bbb2c0de4bbcec3d6597d3a53b2b2a4f105977c935c7042c5706771a8c9ee5088ca403250aa8d11aad6c34806ed0f341a8081d56202206c28d4fbbdf6d436392'
  '76ea6485b7b262ff1d2018150c1fcffd372c6a3f258cfc90542b41928d87e3eeb8f111c7715fb4d01a0594d6808b4dcbc6d9d39fa9057a558bef85dd48201b77'
  '304c4755328f68226a70277584077c7c724453f9ac4b195af65fc72510ace24885ecaa99328a66eaf2e505814457fa4cab86c42d88ecb7d04e45ce85b1b3cce7'
)
noextract=("Doom_Remake_4_experimental_${pkgver}.rar")
DLAGENTS=("https::/bin/sh $(pwd)/moddb-download.sh %o %u")

prepare() {
  unrar x -o- Doom_Remake_4_experimental_${pkgver}.rar
}

package() {
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/games/${pkgname}"
  install -m755 "doom-remake-4-experimental" "${pkgdir}/usr/bin/doom-remake-4-experimental"
  install -m644 "gzdoom.ini" "${pkgdir}/usr/share/games/${pkgname}/gzdoom.ini"
  cp -dr --no-preserve=ownership "${srcdir}/Doom Remake 4 (experimental)/res" "${pkgdir}/usr/share/games/${pkgname}/res"
  install -m644 "${srcdir}/Doom Remake 4 (experimental)/startup.pk3" "${pkgdir}/usr/share/games/${pkgname}/startup.pk3"
}
