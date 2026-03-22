# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=beads-bin
pkgver=0.62.0
pkgrel=1
pkgdesc="Graph-based memory + issue tracker for coding agents (binary release)"
arch=('x86_64')
url="https://github.com/steveyegge/beads"
license=('MIT')
depends=()
options=('!strip' '!debug')
provides=("bd=${pkgver}" "beads=${pkgver}")
conflicts=('beads')

latestver() {
    curl -fsSL 'https://api.github.com/repos/steveyegge/beads/releases/latest' | jq -r '.assets[]?.name' |
    sed -nE '/^beads_[0-9.]+_linux_amd64\.tar\.gz$/{s/^beads_//; s/_linux_amd64\.tar\.gz$//; p;}'
}

source_x86_64=("beads-${pkgver}-linux-amd64.tar.gz::https://github.com/steveyegge/beads/releases/download/v${pkgver}/beads_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('4cca7265b22e5c3ca8d62ab0b9752bec31f68b7f5fa636282a4c7e5454c35535')

package() {
    install -Dm755 "${srcdir}/bd" "${pkgdir}/usr/bin/bd"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
