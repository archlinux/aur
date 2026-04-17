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

sha256sums_x86_64=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')
sha256sums_aarch64=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

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
