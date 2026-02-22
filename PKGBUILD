# Maintainer: werdxz

pkgname=portty-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="XDG Desktop Portal backend for TTY environments (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/werdxz/portty"
license=('MIT')
depends=('xdg-desktop-portal')
provides=('portty')
conflicts=('portty' 'portty-git')
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/WERDXZ/portty/archive/refs/tags/v${pkgver}.tar.gz"
    "portty::https://github.com/WERDXZ/portty/releases/download/v${pkgver}/portty"
    "porttyd::https://github.com/WERDXZ/portty/releases/download/v${pkgver}/porttyd"
)
sha256sums=(
    'a2556b52268db2f14ac8616b08b1d70b570d62cb43cb5c468d68504be4c71abb'
    'e20d9950340bfbde995664f1358b611f5d83fb598158fb74aa9215b70ac597e0'
    '43c91ea396af9ddec1e55f6ec449ac01f297a1eae5250c798ff360ca7b9e4be0'
)

package() {
    cd "portty-${pkgver}"

    # Install daemon
    install -Dm755 "$srcdir/porttyd" "$pkgdir/usr/lib/portty/porttyd"

    # Install CLI
    install -Dm755 "$srcdir/portty" "$pkgdir/usr/bin/portty"

    # Install portal file
    install -Dm644 "misc/tty.portal" "$pkgdir/usr/share/xdg-desktop-portal/portals/tty.portal"

    # Install systemd service
    install -Dm644 "misc/portty.service" "$pkgdir/usr/lib/systemd/user/portty.service"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install example config
    install -Dm644 "misc/config.toml.example" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}
