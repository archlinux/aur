# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=Audio-Solutions
_pkgname=pulse-visualizer
pkgname=${_pkgname}-bin
pkgver=1.3.5
pkgrel=2
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
sha256sums=('29acdd8fef38338e4360f3bbeb8fe8c523912d9eca2baa3d789dea25a2ee9d0d'
            'c53a65c2fd561c87eaabf1072ef5dcab8653042bc15308465f52413585eb6271'
            'cd51469ac88654a8339c855bbbd7f97f2f9ca02358cf1c29981ebe87c03b4e8c')
sha256sums_x86_64=('b0a57d343119214978b3c90fe0f4dd15ef02a8ce0c8dfcb07951458239d78722')

package() {
  cd "${srcdir}" || return

  chmod +x ./install.sh
  ./install.sh "${pkgdir}/usr" "skip-root"

  xdelta3 -f -d -s "${pkgdir}/usr/bin/${_pkgname}" "${srcdir}/fix_libGLEW.patch" "${pkgdir}/usr/bin/${_pkgname}"
}
