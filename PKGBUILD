# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fooyin
_pkgname=Fooyin
pkgver=0.4.2
pkgrel=1
pkgdesc="A customisable music player"
arch=('any')
url="https://github.com/ludouzi/fooyin"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-tools'
    'alsa-lib'
    'taglib'
    'ffmpeg'
    'kdsingleapplication'
)
makedepends=(
    'gcc'
    'git'
    'ninja'
    'base-devel'
    'pkgconf'
    'cmake'
)
optdepends=(
    'sdl2: For the SDL2 audio output plugin'
    'pipewire: For the PipeWire audio output plugin'
)
options=(
    '!strip'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('07bf61e4a51f9facd18029d49d1d8211a6909a3c99fef4ae155c52673669596b')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -S . -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_PCH=ON \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build -j$(nproc)
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/fooyin/LICENSE"
}
