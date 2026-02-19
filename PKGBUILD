# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy
_pkgver=2026.02.19-182823
_pkgtag=2026.02.19-182823
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Wendy CLI - Remote device debugging and deployment for Raspberry Pi, NVIDIA Jetson, and other Linux devices"
arch=('x86_64' 'aarch64')
url="https://wendy.sh"
license=('custom:proprietary')
provides=('wendy')
conflicts=('wendy-git')

source_x86_64=("${pkgname}-${_pkgver}-x86_64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-cli-linux-static-musl-x86_64-${_pkgver}.tar.gz")
source_aarch64=("${pkgname}-${_pkgver}-aarch64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-cli-linux-static-musl-aarch64-${_pkgver}.tar.gz")

# Checksums will be updated by CI
sha256sums_x86_64=('4ed81613e759e5e203c177f18e8fac292eace76c6255ea58fbfc7dc792606a9a')
sha256sums_aarch64=('e475e929ee56828b38b0d228b90805465351ac967ae6fe52fbe526fd1de3bbaa')

package() {
    cd "${srcdir}"

    # Find the extracted directory
    if [[ "${CARCH}" == "x86_64" ]]; then
        install -Dm755 "wendy-cli-linux-static-musl-x86_64/wendy" "${pkgdir}/usr/bin/wendy"
    else
        install -Dm755 "wendy-cli-linux-static-musl-aarch64/wendy" "${pkgdir}/usr/bin/wendy"
    fi
}
