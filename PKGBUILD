# Maintainer: wereii <wereii@wereii.cz>
# Contributor: Base pkgbuild files provided by Damian Blanco <blanco.damian@gmail.com>
# Contributor: franciscod <demartino.francisco@gmail.com>

pkgname=simulide
pkgver="0.4.13_SR5"
pkgrel=1
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers)"
arch=("x86_64")
url="https://www.simulide.com/"
license=("GPL3")
source=("https://mailfence.com/pub/docs/santigoro/web/SimulIDE_${pkgver//_*/}/SimulIDE_${pkgver//_/-}_Sources.tar.gz"
        "simulide.desktop"
        "changelog.txt")
md5sums=("fdb189d2e75a1da3cdae6d2a596d3f08"
         "beda8f4452562e5cc1e2c9a19ac99bb3"
         "SKIP"
        )
changelog="changelog.txt"
depends=(
  "qt5-base>=5.15.1"
  "qt5-multimedia"
  "qt5-serialport"
  "qt5-svg"
  "qt5-script"
  "libelf>=0.181"
)

optdepends=(
  "gpsim: needed for PIC simulation"
  "simavr: needed for AVR simulation"
)

makedepends=(
  "avr-libc"
  "avr-gcc"
)

build() {
  cd "${srcdir}/simulide_${pkgver//_/-}_Sources/build_XX"
  qmake
  make
}

package() {
  install -D -m644 simulide.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${srcdir}/simulide_${pkgver//_/-}_Sources/build_XX/release/SimulIDE_${pkgver//_/-}"

  install -D -m755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -D -m644 "share/icons/hicolor/256x256/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/${pkgname}.png"
  install -d -m755 "${pkgdir}/usr/share/${pkgname}"
  cp -r "share/${pkgname}"/* "${pkgdir}/usr/share/${pkgname}"
}
