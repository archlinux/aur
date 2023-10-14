# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

vername=N64_PAL_10
verdesc="Ocarina of Time Europe PAL Version 1.0"
pkgname=soh-otr-${vername,,}
pkgver=7.1.1.r12.g8872a5928
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
sha256sums=('f29d21e10f77c44d933f07ff6d0f593d4267925f1e6834ce55e239b6037549e7')

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

