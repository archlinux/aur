# Maintainer: devcxl <64475363+devcxl@users.noreply.github.com>

pkgname=fcitx5-voice-input
pkgver=0.4.1
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
)
# 录音后端为可选依赖，至少安装其一（都不装则无法录音）
optdepends=(
    'pipewire: PipeWire capture backend (required for recording)'
    'libpulse: PulseAudio capture backend (required for recording)'
)
makedepends=('cmake' 'pkg-config' 'gettext')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/devcxl/fcitx5-voice-input/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('717ec8d44fb29a5d5893c4a4fd71f11f55a7b19d2d5e74e8e7c4c434e045f6d2')

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