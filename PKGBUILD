# Maintainer: devcxl <64475363+devcxl@users.noreply.github.com>

pkgname=fcitx5-voice-input
pkgver=0.3.1
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
sha256sums=('159cc541069fca9ca75c936aecfd06d2612184358ffcaceaf432914acaba5e17')

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
