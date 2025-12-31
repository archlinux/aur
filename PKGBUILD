# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=witr-bin
pkgver=0.1.5
pkgrel=1
pkgdesc="A Linux CLI tool that explains the causal chain behind running processes"
arch=('x86_64' 'aarch64')
url="https://github.com/pranshuparmar/witr"
license=('Apache-2.0')
provides=('witr')
conflicts=('witr')

source_x86_64=("${pkgname}-${pkgver}-amd64::https://github.com/pranshuparmar/witr/releases/download/v${pkgver}/witr-linux-amd64"
               "witr.1::https://github.com/pranshuparmar/witr/releases/download/v${pkgver}/witr.1")
source_aarch64=("${pkgname}-${pkgver}-arm64::https://github.com/pranshuparmar/witr/releases/download/v${pkgver}/witr-linux-arm64"
                "witr.1::https://github.com/pranshuparmar/witr/releases/download/v${pkgver}/witr.1")

sha256sums_x86_64=('3b97ca5a665594384f2a2ee682d343cc659e4a4c25ef1955d81aabe8866503a5'
                   'f17680e7631eae6f8a10335f2d607c92b1b7db11f9dfa199946d7f28f0e2a8c8')
sha256sums_aarch64=('7d461ed69b347dc1816a9717d0d49026bf2f3d81eb53f26508b83a3949a5ec3f'
                    'f17680e7631eae6f8a10335f2d607c92b1b7db11f9dfa199946d7f28f0e2a8c8')

package() {
    # Determine the binary name based on architecture
    if [ "${CARCH}" = "x86_64" ]; then
        _binary="${pkgname}-${pkgver}-amd64"
    elif [ "${CARCH}" = "aarch64" ]; then
        _binary="${pkgname}-${pkgver}-arm64"
    fi

    # Install the binary
    install -Dm755 "${_binary}" "${pkgdir}/usr/bin/witr"

    # Install the man page
    install -Dm644 "witr.1" "${pkgdir}/usr/share/man/man1/witr.1"
}
