# Maintainer: Matthew Cushing <cushing.matt@gmail.com>
pkgname=qml-language-server-bin
pkgver=1.4.0
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

# Update these after each release with: updpkgsums
sha256sums_x86_64=('a402030dd8f69cfff1d6aa146efd0cce99a55a220965331deb13e7348f77885c')
sha256sums_aarch64=('bf62c3464619ab5749bb6f39d56f1d2be52d3f373c61bf9b2f63262520202a75')

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
