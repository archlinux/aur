# Maintainer: werdxz

pkgname=portty-bin
pkgver=0.3.1
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
    '9cd99857fe67b59ac9ae85da5c3aa5c18e74fd7fdfae856708fa94cc22580c17'
    '67f54d9e195b0eccc11f77af2442602935949e3370417f51914c6f0a6315e4c1'
    '85950999b667046d6ef48c11bb4303241c55075add6c79b60374e16e755e8fb8'
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
