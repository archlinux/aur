# Maintainer: devcxl <64475363+devcxl@users.noreply.github.com>

pkgname=fcitx5-voice-input
pkgver=0.3.0
pkgrel=1
pkgdesc="Fcitx5 voice input addon with OpenAI-compatible and Volcengine Doubao ASR"
arch=('x86_64')
url="https://github.com/devcxl/fcitx5-voice-input"
license=('LGPL-3.0-only')
options=('!debug')
depends=(
    'fcitx5'
    'pipewire'
    'libpulse'
    'jsoncpp'
    'curl'
    'onnxruntime-cpu'
    'zlib'
)
optdepends=()
makedepends=('cmake' 'pkg-config' 'gettext')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/devcxl/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('27f6ffd2432cab662fb9ec3209a9cb1f912f7d6d4a58db2c0fd8c84b5b3ec799')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake --install build --prefix "${pkgdir}/usr"
}
