# Maintainer: blubbblubb <lampadada[removeme][at]googlemail[dot]com>

pkgname=loudgain
pkgver=v0.6.2
_pkgver=0.6.2
pkgrel=1
pkgdesc="A loudness normalizer that scans music files and calculates loudness-normalized gain and loudness peak values according to the EBU R128 standard, and can optionally write ReplayGain-compatible metadata."
url="https://github.com/Moonbase59/loudgain"
arch=('i686' 'x86_64')
license=('BSD 2-Clause "Simplified" License')
depends=("taglib" "libebur128" "ffmpeg")
makedepends=('cmake')
provides=('loudgain' 'rgbpm')
source=("https://github.com/Moonbase59/loudgain/archive/${pkgver}.tar.gz")
sha256sums=('5f982a2c1508b5fe07f1993177126069bc5e76abc0aa2f412409f7774b5b6544')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  mkdir -p build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}/build"
  make DESTDIR="${pkgdir}/" install
  install -D -m755 ../bin/rgbpm ${pkgdir}/usr/bin/
  install -D -m644 "${srcdir}/${pkgname}-${_pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
