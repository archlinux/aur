# Maintainer: wereii <wereii@wereii.cz>
# Contributor: Base pkgbuild files provided by Damian Blanco <blanco.damian@gmail.com>
# Contributor: franciscod <demartino.francisco@gmail.com>

pkgname=simulide
pkgver=0.4.14_SR4
_realver=${pkgver//_/-}
pkgrel=2
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers)"
arch=("x86_64")
url="https://www.simulide.com/"
license=("GPL3")
source=("https://mailfence.com/pub/docs/santigoro/web/SimulIDE_${pkgver//_*/}/simulide_${_realver}_Sources.tar.gz"
	"simulide.desktop"
        "changelog.txt")
md5sums=("c73088d73f9bbf1c5408e53416d849c2"
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
  "qt5-tools"
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
  cd "${srcdir}/simulide_${_realver}_Sources/build_XX"
  qmake
  make
}

package() {
  install -D -m644 simulide.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  #cp "${srcdir}/simulide_${_realver}_Sources/changelog.txt" "${srcdir}/.."

  cd "${srcdir}/simulide_${_realver}_Sources/build_XX/executables/SimulIDE_${_realver}"
  test -s "bin/${pkgname}" && test -x "bin/${pkgname}"
  test -d "share/${pkgname}"

  mkdir -p "${pkgdir}/usr"
  cp -r ./* "${pkgdir}/usr" # usr/bin usr/share
}
