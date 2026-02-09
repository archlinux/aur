# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy-agent
_pkgver=0.1.18
_pkgtag=v0.1.18
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Wendy Agent - Runs on target devices for remote debugging and deployment"
arch=('x86_64' 'aarch64')
url="https://wendy.sh"
license=('custom:proprietary')
provides=('wendy-agent')
conflicts=('wendy-agent-git')
backup=('etc/wendy-agent/config.yaml')

source_x86_64=("${pkgname}-${_pkgver}-x86_64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-agent-linux-static-musl-x86_64-${_pkgver}.tar.gz")
source_aarch64=("${pkgname}-${_pkgver}-aarch64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgtag}/wendy-agent-linux-static-musl-aarch64-${_pkgver}.tar.gz")

# Checksums will be updated by CI
sha256sums_x86_64=('b57b3cd0fd38c13a610047f8b6f1d4912e2434f02af3b80ee57886631ac4ba5f')
sha256sums_aarch64=('22768f169c8ab53fcc2ad96b361f658ed173c0cbde3576acdb71f966cb68bd15')

package() {
    cd "${srcdir}"

    # Find the extracted directory and install binary
    if [[ "${CARCH}" == "x86_64" ]]; then
        install -Dm755 "wendy-agent-linux-static-musl-x86_64/wendy-agent" "${pkgdir}/usr/bin/wendy-agent"
    else
        install -Dm755 "wendy-agent-linux-static-musl-aarch64/wendy-agent" "${pkgdir}/usr/bin/wendy-agent"
    fi

    # Create config directory
    install -dm755 "${pkgdir}/etc/wendy-agent"
}
