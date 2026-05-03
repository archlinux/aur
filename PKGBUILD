# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fooyin
_pkgname=Fooyin
pkgver=0.10.4
pkgrel=1
pkgdesc="A customisable music player."
arch=('x86_64')
url="https://www.fooyin.org/"
_ghurl="https://github.com/ludouzi/fooyin"
license=('GPL-3.0-only')
depends=(
    'icu'
    'glibc'
    'libstdc++'
    'libgcc'
    'qt6-base'
    'alsa-lib'
    'taglib'
    'ffmpeg'
    'kdsingleapplication'
    'qcoro'
)
makedepends=(
    'qt6-svg'
    'qt6-tools'
    'ninja'
    'cmake'
    'libpipewire'
    'libopenmpt'
    'libsndfile'
    'libebur128'
    'libarchive'
    'libgme'
    'soundtouch'
)
optdepends=(
    'sdl2: For the SDL2 audio output plugin'
    'libpipewire: For the PipeWire audio output plugin'
    'libopenmpt: For the OpenMPT audio input plugin'
    'libgme: For the GME audio input plugin'
    'libsndfile: For the GME audio input plugin'
    'libarchive: For the libarchive archive plugin'
    'libebur128: For the ReplayGain scanner plugin'
    'libsoxr: For the SoX-based DSP plugin'
    'soundtouch: For the SoundTouch-based DSP plugin'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('2c011a23fb46d5d8112ae0f55039ed0260808e7c4e0cc40c405751b7035d7325')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -S . -B build -G Ninja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_PCH=ON \
        -DBUILD_WERROR=OFF \
        -DINSTALL_HEADERS=ON \
        -DCMAKE_BUILD_TYPE=None
    cmake --build build
}
package() {
    depends+=('hicolor-icon-theme')

    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/fooyin/LICENSE"
}
