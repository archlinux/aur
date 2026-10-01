# Maintainer: devcxl <64475363+devcxl@users.noreply.github.com>

pkgname=fcitx5-voice-input
pkgver=0.6.0
pkgrel=1
pkgdesc="Fcitx5 voice input addon with OpenAI-compatible and Volcengine Doubao ASR"
arch=('x86_64')
url="https://github.com/devcxl/fcitx5-voice-input"
license=('LGPL-3.0-or-later')
options=('!debug')
depends=(
    'fcitx5'
    'jsoncpp'
    'curl'
    'onnxruntime-cpu'
    'zlib'
    'libpulse'
)
# PipeWire 为 PulseAudio 基线失败时的可选直连回退。
optdepends=(
    'pipewire: PipeWire direct capture fallback backend'
)
makedepends=('cmake' 'pkg-config' 'gettext' 'pipewire')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/devcxl/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('92c77d6a1db877d5f35cfae90db4b56a470923237ea85285e84400a7679ad363')

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