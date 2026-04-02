# Maintainer: DimmKG <dirkg361@gmail.com>
# Contributor: wereii <wereii@wereii.cz>
# Contributor: Base pkgbuild files provided by Damian Blanco <blanco.damian@gmail.com>
# Contributor: franciscod <demartino.francisco@gmail.com>

pkgname=simulide
pkgver=1.1.0_SR2
_version_branch=1.1.0
_realver=${pkgver//_/-}
_commit=28965e3bd6dd118598db1f5639ce1cf2e3c56e36
pkgrel=3
pkgdesc="Real time electronic circuit simulator (supports PIC, AVR and Arduino microcontrollers)."
arch=("x86_64")
url="https://github.com/Arcachofo/SimuliDE-1"
provides=('simulide')
conflicts=('simulide')
license=("AGPL-3.0-only")
source=(
  "${pkgname}::git+https://github.com/Arcachofo/SimuliDE-1.git#commit=$_commit"
  "simulide.desktop")
sha256sums=(
  'a792c15e0ef208001cb641b5b399d84112d34073c6636fbe5c683e87a7481969'
  'a5b1f6b19d3fc2e93baa98beb000488a0e1f0fd93935cc7d86e8f0b345c11f23')

depends=(
  "qt5-base>=5.15.1"
  "qt5-multimedia"
  "qt5-serialport"
  "qt5-svg"
  "qt5-script"
)

makedepends=(
  "git"
  "qt5-tools"
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
