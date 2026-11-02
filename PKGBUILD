# Maintainer: Etienne Charland <mysteryx93 at protonmail dot com>
# Upstream: pinterf — https://github.com/pinterf/mvtools
# Distinct from classic Fizick MVTools and from vapoursynth-plugin-mvtools.

pkgname=avisynth-plugin-mvtools2-pinterf
pkgver=2.7.48
pkgrel=1
pkgdesc="AviSynth+ MVTools2 (pinterf) — motion estimation and compensation"
arch=('x86_64')
url='https://github.com/pinterf/mvtools'
license=('GPL-2.0-only')
depends=('avisynthplus' 'fftw')
makedepends=('cmake')
conflicts=('avisynth-plugin-mvtools2-pinterf-bin')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pinterf/mvtools/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('623eac4543bfbe56052518bb6c43698712502e6761b4f646f7f47431f931c792')

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
