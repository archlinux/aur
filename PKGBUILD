# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

_romname=gc_nmq_pal_f
_romdesc="Ocarina of Time Gamecube Europe PAL"
pkgname=soh-otr-${_romname}
pkgver=1
pkgrel=3
pkgdesc="OTR game data for SoH (${_romdesc})"
arch=("any")
url="https://github.com/HarbourMasters/Shipwright"
license=("unknown")
provides=("soh-otr")
conflicts=("soh-otr")
depends=("soh")
makedepends=("soh-otr-exporter")
source=("file://baserom.z64")
sha256sums=('f788793d27aac3f8d91be5f242c4134217c615bfddd5c70384521ea2153435d2')

SHIP_PREFIX=/opt/soh

build() {
  cd "${srcdir}"

  [ -e oot.otr ] && rm oot.otr
  [ ! -e assets ] && ln -s ${SHIP_PREFIX}/assets assets
  [ -e Extract ] && rm -r Extract; mkdir Extract
  cp -r "${SHIP_PREFIX}"/assets/game Extract/assets/

  "assets/extractor/ZAPD.out" ed -eh -i "assets/extractor/xmls/${_romname^^}" \
    -b baserom.z64 -fl "assets/extractor/filelists" -o placeholder -osf placeholder -gsf 1 \
    -rconf "assets/extractor/Config_${_romname^^}.xml" -se OTR
}

package() {
  cd "${srcdir}"

  install -Dm644 oot.otr -t "${pkgdir}/${SHIP_PREFIX}"
}

