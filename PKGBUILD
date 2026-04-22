# Maintainer: werdxz

pkgname=portty-bin
pkgver=0.3.3
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
    '8be421a20f63177d0ea8dcf3dfe5ba2ab74d4b4b891ae0325096a8f8e1374f40'
    '159fa128580c7a3493e217c8c921ab1879b7f61a6f70361751c4f94761cd4f47'
    'ce6ce350d8cd5e6039a12a269621aeb16e122cf3dce3c68fc90473e2e4763d47'
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

    # Install D-Bus activation service
    install -Dm644 "misc/org.freedesktop.impl.portal.desktop.tty.service" \
        "$pkgdir/usr/share/dbus-1/services/org.freedesktop.impl.portal.desktop.tty.service"

    # Install license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Install example config
    install -Dm644 "misc/config.toml.example" "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
}
