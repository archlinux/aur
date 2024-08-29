# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fooyin
_pkgname=Fooyin
pkgver=0.6.1
pkgrel=2
pkgdesc="A customisable music player"
arch=('x86_64')
url="https://github.com/ludouzi/fooyin"
license=('GPL-3.0-only')
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-tools'
    'alsa-lib'
    'taglib'
    'ffmpeg'
    'kdsingleapplication'
    'libgme'
    'libarchive'
    'libvgm-player-git'
)
makedepends=(
    'gcc'
    'ninja'
    'pkgconf'
    'cmake'
    'libpipewire'
    'icu'
    'libopenmpt'
    'libsndfile'
    'git'
)
optdepends=(
    'sdl2: For the SDL2 audio output plugin'
    'pipewire: For the PipeWire audio output plugin'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('b1885ac100d19ca49d4676ae9bfe7e5bdef191dee89eae77bd5682086e049231')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -S . -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_PCH=ON \
        -DBUILD_WERROR=ON \
        -DINSTALL_HEADERS=ON \
        -DCMAKE_BUILD_TYPE=None
    cmake --build build -j$(nproc)
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/fooyin/LICENSE"
}