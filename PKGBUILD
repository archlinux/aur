# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=witr-bin
pkgver=0.3.2
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

sha256sums_x86_64=('7460cfd099ff41a24a089e6f604496c22a41d4663749cb11b4014019898e16d4'
                   '6150d6e55625bedac5dfbd7d69d6aaa2360fc1d653ab3830a20f72373db77b7a')
sha256sums_aarch64=('0933677b00e68f90a6e093b8070ee8cff1a37beb2941b1e0fe00e2631dfe5532'
                    '6150d6e55625bedac5dfbd7d69d6aaa2360fc1d653ab3830a20f72373db77b7a')

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
