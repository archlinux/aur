# Maintainer: Patrick Jaja <patrick.jaja@valantic.com>
pkgname=claude-cowork-service
pkgver=0.1.0
pkgrel=1
pkgdesc="Native Linux backend for Claude Desktop Cowork"
arch=('x86_64')
url="https://github.com/patrickjaja/claude-cowork-service"
license=('MIT')
depends=()
makedepends=('go')
provides=('claude-cowork-service')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    make VERSION="${pkgver}"
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install binary
    install -Dm755 cowork-svc-linux "$pkgdir/usr/bin/cowork-svc-linux"

    # Install systemd user service
    install -Dm644 dist/claude-cowork.service "$pkgdir/usr/lib/systemd/user/claude-cowork.service"

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set ts=4 sw=4 et:
