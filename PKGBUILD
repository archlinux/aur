# Maintainer: DimmKG <dirkg361@gmail.com>
# Contributor: wereii <wereii@wereii.cz>
# Contributor: Base pkgbuild files provided by Damian Blanco <blanco.damian@gmail.com>
# Contributor: franciscod <demartino.francisco@gmail.com>

pkgname=simulide
pkgver=1.1.0_SR1
_version_branch=1.1.0
_realver=${pkgver//_/-}
_rev=2019
pkgrel=4
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers)."
arch=("x86_64")
url="https://launchpad.net/simulide"
provides=('simulide')
conflicts=('simulide')
license=("AGPL-3.0-or-later")
source=(
  "${pkgname}::bzr+https://code.launchpad.net/~arcachofo/simulide/${_version_branch}#revision=revno:${_rev}"
  "simulide.desktop")
sha256sums=(
  SKIP
  'a5b1f6b19d3fc2e93baa98beb000488a0e1f0fd93935cc7d86e8f0b345c11f23')

depends=(
  "qt5-base>=5.15.1"
  "qt5-multimedia"
  "qt5-serialport"
  "qt5-svg"
  "qt5-script"
  "qt5-tools"
)

makedepends=(
  "python-dulwich"
  "bzr"
)


build() {
  cd "${srcdir}/${pkgname}/build_XX"
  qmake
  make
}

package() {
  install -D -m644 simulide.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  cd "${srcdir}/${pkgname}/build_XX/executables/SimulIDE_${_realver}"
  # binary
  mkdir -p "${pkgdir}/usr/bin"
  cp simulide "${pkgdir}/usr/bin/"
  # data
  mkdir -p "${pkgdir}/usr/share/simulide"
  cp -r ./ "${pkgdir}/usr/share/simulide"
  rm ${pkgdir}/usr/share/simulide/simulide
 
  # icon
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/256x256"
  cp -r ${srcdir}/${pkgname}/resources/icons/simulide.png* "${pkgdir}/usr/share/icons/hicolor/256x256/simulide.png"

}
