# Maintainer: Andy Kelk <andy@andykelk.net>
pkgname=witr-bin
pkgver=0.3.0
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

sha256sums_x86_64=('370e4a6629ca14bb40754137e2481023cf026b5344acb012d3862bb46dbb715a'
                   'e0c4dff42d7d72e6aa501d9aefeb775c3419c523ddf093ef52ffdbaa1968935e')
sha256sums_aarch64=('ceaa88f5bde5ecf797eb5e38fea9487778aa3e1de47a81a50ca71e6c89334d98'
                    'e0c4dff42d7d72e6aa501d9aefeb775c3419c523ddf093ef52ffdbaa1968935e')

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
