# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Audio-Solutions
_pkgname=pulse-visualizer
pkgname=${_pkgname}-bin
pkgver=1.3.6
pkgrel=1
pkgdesc="A GPU-accelerated audio visualizer for PulseAudio/PipeWire"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('GPL-3.0-only')

install=pulse-visualizer-bin.install
makedepends=('xdelta3')
depends=('glibc' 'gcc-libs' 'libebur128' 'glew' 'freetype2' 'libglvnd' 'libpipewire' 'sdl3' 'libpulse' 'yaml-cpp' 'fftw')
conflicts=("${_pkgname}" "${_pkgname}"-git)
provides=("${_pkgname}")

source=("fix_libGLEW.patch"
        "${_urlraw}/LICENSE"
        "${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-Linux.tar.gz")
sha256sums=('33a47c42acc8f830ae13840271d69c755646208207b0b0962cdce3f6158ed035'
            'c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271'
            '8e15fcb6123dacc19ddcfa249e7b10d600e09624b9106821b3bd2f4dd7afb7ba')
sha256sums_x86_64=('7742669577b33659e1f0647892c5f7ceb7a47ea63b53fe028a685e30f7ad3f6d')

package() {
  cd "${srcdir}" || return

  chmod +x ./install.sh
  ./install.sh "${pkgdir}/usr" "skip-root"

  xdelta3 -f -d -s "${pkgdir}/usr/bin/${_pkgname}" "${srcdir}/fix_libGLEW.patch" "${pkgdir}/usr/bin/${_pkgname}"
}
