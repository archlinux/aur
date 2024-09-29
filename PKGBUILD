# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fooyin
_pkgname=Fooyin
pkgver=0.7.3
pkgrel=1
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
sha256sums=('8fc803d9acaf513d40820f1f78c5e4d3dc730529cdebc07b87e3c674eb00508b')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -S . -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_PCH=ON \
        -DBUILD_WERROR=ON \
        -DINSTALL_HEADERS=ON \
        -DCMAKE_BUILD_TYPE=None
    cmake --build build -j"$(nproc)"
}
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/fooyin/LICENSE"
}