# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

vername=GC_NMQ_D
verdesc="Ocarina of Time Gamecube Europe PAL Debug"
pkgname=soh-otr-${vername,,}
pkgver=7.0.2.r82.gef6227d8b
pkgrel=1
epoch=1   # For old versions of SoH, if available
pkgdesc="OTR game data for SoH (${verdesc})"
arch=("any")
url="https://shipofharkinian.com/"
license=("unknown")
provides=("soh-otr")
conflicts=("soh-otr")
makedepends=("soh-otr-exporter")
source=("file://baserom.z64")
sha256sums=('94bdeb4ab906db112078a902f4477e9712c4fe803c4efb98c7b97c3f950305ab')

SHIP_PREFIX=/opt/soh

pkgver() {
  pacman -Q soh-otr-exporter | sed -E 's/.* (.*)-.*$/\1/'
}

build() {
  cd "${srcdir}"

  [ -e oot.otr ] && rm oot.otr

  "${SHIP_PREFIX}/assets/extractor/ZAPD.out" ed -eh \
    -i "${SHIP_PREFIX}/assets/extractor/xmls/${vername}" -b baserom.z64 \
    -fl "${SHIP_PREFIX}/assets/extractor/filelists" -o . -osf . -gsf 0 \
    -rconf "${SHIP_PREFIX}/assets/extractor/Config_${vername}.xml" -se OTR --otrfile oot.otr
}

package() {
  cd "${srcdir}"

  install -Dm644 oot.otr -t "${pkgdir}/${SHIP_PREFIX}"
}

