# Maintainer: peachoff <peshoff@proton.me>
pkgname=zapret-hub
pkgver=3.0.0
pkgrel=1
pkgdesc="Desktop hub for managing network bypass utilities (zapret, tg-ws-proxy, vpn)"
arch=('x86_64')
url="https://github.com/larpmaster228/Zapret-Hub-Linux"
license=('MIT')
options=('!strip')
depends=('glib2' 'libglvnd' 'nftables' 'iproute2')
optdepends=('qt6-base: Qt GUI' 'qt6-wayland: Wayland support')
source=("$url/releases/download/v${pkgver}-linux/zapret_hub_${pkgver}_linux_x64.tar.gz")
sha256sums=('SKIP')

package() {
    cd "${srcdir}"

    install -dm755 "${pkgdir}/opt/zapret-hub"
    cp -a "zapret_hub_${pkgver}_linux_x64/"* "${pkgdir}/opt/zapret-hub/"

    install -Dm644 "${pkgdir}/opt/zapret-hub/ui_assets/icons/app.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/zapret-hub.png" 2>/dev/null || true

    install -dm755 "${pkgdir}/usr/bin"
    printf '#!/bin/sh\nexec /opt/zapret-hub/zapret_hub "$@"\n' \
        > "${pkgdir}/usr/bin/zapret-hub"
    chmod 755 "${pkgdir}/usr/bin/zapret-hub"
}
