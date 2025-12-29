# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy
_pkgver=2025.12.29-100234
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Wendy CLI - Remote device debugging and deployment for Raspberry Pi, NVIDIA Jetson, and other Linux devices"
arch=('x86_64' 'aarch64')
url="https://wendy.sh"
license=('custom:proprietary')
provides=('wendy')
conflicts=('wendy-git')

source_x86_64=("${pkgname}-${_pkgver}-x86_64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgver}/wendy-cli-linux-static-musl-x86_64-${_pkgver}.tar.gz")
source_aarch64=("${pkgname}-${_pkgver}-aarch64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgver}/wendy-cli-linux-static-musl-aarch64-${_pkgver}.tar.gz")

# Checksums will be updated by CI
sha256sums_x86_64=('3031b098a3609cefe8deea162977154fb9bd7d76f2f81cb6534e07e25f0b3c32')
sha256sums_aarch64=('dbdeea9ac58064ac756ac676d556427fdc2f838e047c627bf8cddd90ca3278dc')

package() {
    cd "${srcdir}"

    # Find the extracted directory
    if [[ "${CARCH}" == "x86_64" ]]; then
        install -Dm755 "wendy-cli-linux-static-musl-x86_64/wendy" "${pkgdir}/usr/bin/wendy"
    else
        install -Dm755 "wendy-cli-linux-static-musl-aarch64/wendy" "${pkgdir}/usr/bin/wendy"
    fi
}
