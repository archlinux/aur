# Maintainer: devcxl <64475363+devcxl@users.noreply.github.com>

pkgname=fcitx5-voice-input
pkgver=0.5.0
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/devcxl/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ab5969c3072da66c74ac773e8fb4f7a85f339ffdc82538cc63be90e1fc80a852')

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