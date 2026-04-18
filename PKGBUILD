# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=qml-language-server-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Language Server Protocol implementation for QML"
arch=('x86_64' 'aarch64')
url="https://github.com/cushycush/qml-language-server"
license=('MIT')
provides=('qml-language-server')
conflicts=('qml-language-server' 'qml-language-server-git')

_base_url="${url}/releases/download/v${pkgver}/qml-language-server-v${pkgver}"

source_x86_64=("${_base_url}-linux-amd64.zip")
source_aarch64=("${_base_url}-linux-arm64.zip")

sha256sums_x86_64=('ad6e88b0fffbe5ee03fc9f6502c0103aa047c02c4942c547715283443bf4e946')
sha256sums_aarch64=('df473af4af176ee9170fbcf596ce07d6496c4a7aa2bd93577430daef014b39de')

package() {
    cd "${srcdir}"
    if [[ "${CARCH}" == "x86_64" ]]; then
        _bin="qml-language-server-v${pkgver}-linux-amd64"
    else
        _bin="qml-language-server-v${pkgver}-linux-arm64"
    fi
    install -Dm755 "${_bin}" "${pkgdir}/usr/bin/qml-language-server"
    install -Dm644 <(curl -sL "${url}/raw/v${pkgver}/LICENSE") "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
