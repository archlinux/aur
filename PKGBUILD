# Maintainer: Wendy Labs Inc. <support@wendy.sh>
pkgname=wendy-agent
_pkgver=2025.12.27-201056-dev
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
sha256sums_x86_64=('b1adb42915565d286156c7871e947c681136570e1d0c1a0ba5cd320f00729151')
sha256sums_aarch64=('dbfdd237c220876a7ed322fafbcb978979d9b22143a108245b342d15e66b6025')

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
