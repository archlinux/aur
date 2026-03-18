# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=witr-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="A Linux CLI tool that explains the causal chain behind running processes"
arch=('x86_64' 'aarch64')
url="https://github.com/pranshuparmar/witr"
license=('Apache-2.0')
provides=('witr')
conflicts=('witr')

source_x86_64=("${pkgname}-${pkgver}-amd64::https://github.com/pranshuparmar/witr/releases/download/v${pkgver}/witr-linux-amd64"
               "witr.1-${pkgver}::https://github.com/pranshuparmar/witr/releases/download/v${pkgver}/witr.1")
source_aarch64=("${pkgname}-${pkgver}-arm64::https://github.com/pranshuparmar/witr/releases/download/v${pkgver}/witr-linux-arm64"
                "witr.1-${pkgver}::https://github.com/pranshuparmar/witr/releases/download/v${pkgver}/witr.1")

sha256sums_x86_64=('e2006ec892335316b4e12dc5a5c09fe0905afa46488da6d6d5a114fde009306b'
                   'a941d33780452594291ee01bdbbd6cb28a675fd174f4037b2a5f42b13bdcfcec')
sha256sums_aarch64=('71a76374435fdc85906da485292ef1831c6b00787d2fc6c114ed502e9c04af4e'
                    'a941d33780452594291ee01bdbbd6cb28a675fd174f4037b2a5f42b13bdcfcec')

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
    install -Dm644 "witr.1-${pkgver}" "${pkgdir}/usr/share/man/man1/witr.1"
}
