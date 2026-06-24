# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=witr-bin
pkgver=0.3.3
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

sha256sums_x86_64=('08fc46e3f80a374476f71d0d6e6579477cd98c6df5cc59d98224adf948f5ebf5'
                   '2caa40896e7c3c7c6aeb582d63f0632e820efaa40ca523c294ba35b70da8d2d2')
sha256sums_aarch64=('dca2be6cf56a5274de0a036b83345d055b8e94f7f4fd23dc54dd102d7669e2d8'
                    '2caa40896e7c3c7c6aeb582d63f0632e820efaa40ca523c294ba35b70da8d2d2')

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
