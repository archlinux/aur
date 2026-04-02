# Maintainer: werdxz

pkgname=portty-bin
pkgver=0.3.2
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
    "portty-bin-${pkgver}::https://github.com/WERDXZ/portty/releases/download/v${pkgver}/portty"
    "porttyd-bin-${pkgver}::https://github.com/WERDXZ/portty/releases/download/v${pkgver}/porttyd"
)
sha256sums=(
    '67a34b76491e7eb6bb40309fb55af4f4fab2da3500e30bc98af8171220efdebf'
    '7d2b2d39deaee8052be39e5b5534e06a3d8c52b389279b780a614fcacc4c3b97'
    '3007fbff48bae9dbfb2d62b9fea772d9ca45284254389be96630679bccbc1fb3'
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
