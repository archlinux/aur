# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=beads-bin
pkgver=0.43.0
pkgrel=1
pkgdesc="Graph-based memory + issue tracker for coding agents (binary release)"
arch=('x86_64')
url="https://github.com/steveyegge/beads"
license=('MIT')
depends=()
options=('!strip')
provides=("bd=${pkgver}" "beads=${pkgver}")
conflicts=('beads')

latestver() {
    local latest
    latest=$(curl -fsS "https://api.github.com/repos/steveyegge/beads/releases/latest" \
        | grep -Po '"tag_name": "v\K[^"]+' \
        | head -n1 || true)
    printf '%s\n' "${latest:-$pkgver}"
}

source_x86_64=("beads-${pkgver}-linux-amd64.tar.gz::https://github.com/steveyegge/beads/releases/download/v${pkgver}/beads_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('73497f6b1e302d62f6663044c65a65b75136835aab6b494191386c73a1660eee')

package() {
    install -Dm755 "${srcdir}/bd" "${pkgdir}/usr/bin/bd"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
