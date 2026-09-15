# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
# Upstream: pinterf — https://github.com/pinterf/mvtools
# Distinct from classic Fizick MVTools and from vapoursynth-plugin-mvtools.

pkgname=avisynth-plugin-mvtools2-pinterf
pkgver=2.7.47
pkgrel=1
pkgdesc="AviSynth+ MVTools2 (pinterf) — motion estimation and compensation"
arch=('x86_64')
url='https://github.com/pinterf/mvtools'
license=('GPL-2.0-only')
depends=('avisynthplus' 'fftw')
makedepends=('cmake')
conflicts=('avisynth-plugin-mvtools2-pinterf-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pinterf/mvtools/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2c5f17ea196c1e52abbbc5728d5fffb39f669104412e831765d341c28cdb21eb')

# Keep pinterf's vendored AviSynth+ headers (interface v12: AcquireGlobalLock).
# Arch avisynthplus 3.7.5 is still v11. Runtime checks has_at_least_v12.

build() {
    cmake -S "mvtools-${pkgver}" -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "mvtools-${pkgver}/Documentation/mvtools2.html" \
        "${pkgdir}/usr/share/doc/${pkgname}/mvtools2.html" || true
}
