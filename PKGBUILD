# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy-agent
_pkgver=2026.02.17-220226
_pkgtag=2026.02.17-220226
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
sha256sums_x86_64=('14db05932652d6de8a0ad2238908ca559be1872404cf1fbf2c4b2696decd0874')
sha256sums_aarch64=('887e53167a1fddc6039199ce021d0b042858176a568cc8438661cead4d2e15b9')

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
