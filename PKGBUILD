# Maintainer: AltoXorg <atrl101 AT yahoo DOT com>

vername=GC_MQ_PAL_F
verdesc="Ocarina of Time Master Quest Europe PAL"
pkgname=soh-otr-${vername,,}
pkgver=7.1.1.r68.g8fdee6661
pkgrel=1
epoch=1   # For old versions of SoH, if available
pkgdesc="OTR game data for SoH (${verdesc})"
arch=("any")
url="https://shipofharkinian.com/"
license=("unknown")
provides=("soh-otr-mq")
conflicts=("soh-otr-mq")
makedepends=("soh-otr-exporter")
source=("file://baserom.z64")
sha256sums=('ed392a890d5fab1c4d6863c69a40df6ca966f568160f2b2a9a73e5d02a6e93c2')

SHIP_PREFIX=/opt/soh

pkgver() {
  pacman -Q soh-otr-exporter | sed -E 's/.* (.*)-.*$/\1/'
}

build() {
  cd "${srcdir}"

  [ -e oot-mq.otr ] && rm oot-mq.otr

  "${SHIP_PREFIX}/assets/extractor/ZAPD.out" ed -eh \
    -i "${SHIP_PREFIX}/assets/extractor/xmls/${vername}" -b baserom.z64 \
    -fl "${SHIP_PREFIX}/assets/extractor/filelists" -o . -osf . -gsf 0 \
    -rconf "${SHIP_PREFIX}/assets/extractor/Config_${vername}.xml" -se OTR --otrfile oot-mq.otr
}

package() {
  cd "${srcdir}"

  install -Dm644 oot-mq.otr -t "${pkgdir}/${SHIP_PREFIX}"
}

