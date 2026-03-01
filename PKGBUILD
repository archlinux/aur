# Maintainer: werdxz

pkgname=portty-bin
pkgver=0.2.1
pkgrel=2
pkgdesc="XDG Desktop Portal backend for TTY environments (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/werdxz/portty"
license=('MIT')
depends=('xdg-desktop-portal')
provides=('portty')
conflicts=('portty' 'portty-git')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/WERDXZ/portty/archive/refs/tags/v${pkgver}.tar.gz"
    "portty-bin-${pkgver}::https://github.com/WERDXZ/portty/releases/download/v${pkgver}/portty"
    "porttyd-bin-${pkgver}::https://github.com/WERDXZ/portty/releases/download/v${pkgver}/porttyd"
)
sha256sums=(
    '351e0c12a57e182b1cbf0669085288502ef541334d6c2992645ed0b103fc711c'
    '80a0865ed3a8542c06d2ab7dc6d0d06336e85fa38623c9fcb49a493473c19541'
    'e8b591674e42c07a65d4703f269f902c28155da20842bf3fd3d507970689e406'
)

package() {
    cd "portty-${pkgver}"

    # Install daemon
    install -Dm755 "$srcdir/porttyd-bin-${pkgver}" "$pkgdir/usr/lib/portty/porttyd"

    # Install CLI
    install -Dm755 "$srcdir/portty-bin-${pkgver}" "$pkgdir/usr/bin/portty"

    # Install portal file
    install -Dm644 "misc/tty.portal" "$pkgdir/usr/share/xdg-desktop-portal/portals/tty.portal"

    # Install systemd service
    install -Dm644 "misc/portty.service" "$pkgdir/usr/lib/systemd/user/portty.service"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install example config
    install -Dm644 "misc/config.toml.example" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}
