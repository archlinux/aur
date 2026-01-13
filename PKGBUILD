# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy-agent
_pkgver=2026.01.13-093613
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc="Wendy Agent - Runs on target devices for remote debugging and deployment"
arch=('x86_64' 'aarch64')
url="https://wendy.sh"
license=('custom:proprietary')
provides=('wendy-agent')
conflicts=('wendy-agent-git')
backup=('etc/wendy-agent/config.yaml')

source_x86_64=("${pkgname}-${_pkgver}-x86_64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgver}/wendy-agent-linux-static-musl-x86_64-${_pkgver}.tar.gz")
source_aarch64=("${pkgname}-${_pkgver}-aarch64.tar.gz::https://github.com/wendylabsinc/wendy-agent/releases/download/${_pkgver}/wendy-agent-linux-static-musl-aarch64-${_pkgver}.tar.gz")

# Checksums will be updated by CI
sha256sums_x86_64=('abdb7d7bb0b262e7917de64b127c1067a819a5ebeb66eeddd7e7b9db49b93d77')
sha256sums_aarch64=('30ceda47ec15f7995d88bb6854524a7131e9259e7a494bc5b100cd9dc6e92f24')

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
