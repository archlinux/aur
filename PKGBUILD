# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=beads-bin
pkgver=0.17.7
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
sha256sums_x86_64=('116561e5df083bb85e0c3b81c40bed299c4853f3446846c927da3114be96d43d')
sha256sums_aarch64=('2d875b7ba009c28c63403df249526806d1bbb9be5ebb2b2aed3b87ee4fcdcffd')

package() {
    install -Dm755 "${srcdir}/bd" "${pkgdir}/usr/bin/bd"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
