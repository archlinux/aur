# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=beads-bin
pkgver=0.21.1
pkgrel=1
pkgdesc="Graph-based memory + issue tracker for coding agents (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/steveyegge/beads"
license=('MIT')
depends=()
options=('!strip')
provides=("bd=${pkgver}" "beads=${pkgver}")
conflicts=('beads')

pkgver() {
    local latest
    latest=$(curl -fsS "https://api.github.com/repos/steveyegge/beads/releases/latest" \
        | grep -Po '"tag_name": "v\K[^"]+' \
        | head -n1 || true)
    printf '%s\n' "${latest:-$pkgver}"
}

source_x86_64=("beads-${pkgver}-linux-amd64.tar.gz::https://github.com/steveyegge/beads/releases/download/v${pkgver}/beads_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("beads-${pkgver}-linux-arm64.tar.gz::https://github.com/steveyegge/beads/releases/download/v${pkgver}/beads_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('162076e42a57942973c02c94d46940abdbb6b0794218d675ceff334080bedb90')
sha256sums_aarch64=('b8cda2d4a060e1adea110eab741fdc939b5dd8920cd41117ae52241884fd81a3')

package() {
    install -Dm755 "${srcdir}/bd" "${pkgdir}/usr/bin/bd"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
