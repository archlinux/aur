# Maintainer: Conor Finn <5526114+finnconor@users.noreply.github.com>
pkgname=nm-wayland-git
pkgver=0.1.0
pkgrel=1
pkgdesc="A lightweight NetworkManager GUI for Wayland compositors"
arch=('x86_64')
url="https://github.com/finnconor/nm-wayland"
license=('MIT')
options=('!debug')
depends=('gtk4' 'libadwaita' 'networkmanager' 'ttf-font-awesome')
optdepends=('networkmanager-openvpn: import OpenVPN (.ovpn) configurations')
makedepends=('rust' 'git')
provides=('nm-wayland')
conflicts=('nm-wayland')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname%-git}"
    cargo build --release --locked
}

package() {
    cd "${pkgname%-git}"
    install -Dm755 "target/release/nm-wayland" "$pkgdir/usr/bin/nm-wayland"
    install -Dm644 "data/org.nm-wayland.desktop" \
        "$pkgdir/usr/share/applications/org.nm-wayland.desktop"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
