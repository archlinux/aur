# Maintainer: jao <jao@example.com>
pkgname=cranky-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A minimalist, performant, and modular bar for Hyprland (pre-built binary)"
arch=('x86_64')
url="https://github.com/jaoppb/cranky"
license=('MIT' 'Apache')
depends=('wayland' 'libxkbcommon' 'fontconfig' 'dbus')
optdepends=('uwsm: for systemd session management')
provides=('cranky')
conflicts=('cranky')
# Assuming assets are named cranky-v0.1.0-x86_64.tar.gz in the release
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/cranky-v${pkgver}-x86_64.tar.gz"
        "cranky.service::${url}/raw/main/contrib/systemd/cranky.service"
        "cranky-uwsm.service::${url}/raw/main/contrib/systemd/cranky-uwsm.service")
sha256sums=('SKIP' 'SKIP' 'SKIP')

package() {
    # Install the binary
    install -Dm755 "cranky" "${pkgdir}/usr/bin/cranky"

    # Install documentation and license
    install -Dm644 README.md "${pkgdir}/usr/share/doc/cranky/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/cranky/LICENSE"

    # Install systemd unit files
    install -Dm644 "cranky.service" "${pkgdir}/usr/lib/systemd/user/cranky.service"
    install -Dm644 "cranky-uwsm.service" "${pkgdir}/usr/lib/systemd/user/cranky-uwsm.service"
}
