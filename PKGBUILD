# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy-agent
_pkgver=2026.02.19-182823
_pkgtag=2026.02.19-182823
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
sha256sums_x86_64=('517efcbf11ee18f25a659ad23938342a907bf25726c10c667cd404d5b12c3563')
sha256sums_aarch64=('3a306136f008e758a80f8d59196adaff81d68f20f430a88bcb9fd31017a21b00')

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
