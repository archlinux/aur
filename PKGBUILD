# Maintainer: lainx86 <lainx86@users.noreply.github.com>
pkgname=aero-audio
_pkgname=aero
pkgver=1.0.0
pkgrel=1
pkgdesc="A modern audio recorder with real-time waveform visualization"
arch=('x86_64')
url="https://github.com/lainx86/aero"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-multimedia'
    'qt6-multimedia-ffmpeg'
)
makedepends=(
    'cmake'
    'gcc'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lainx86/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('054e4d3de9a36aee6574bd9fac3713660d9fef37203ebf86521d07114aa2c6d6')

build() {
    cd "${_pkgname}-${pkgver}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build -j$(nproc)
}

package() {
    cd "${_pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
