# Maintainer: bjarneo <https://github.com/bjarneo>
pkgname=tema-git
pkgver=2.1.1
pkgrel=1
pkgdesc='Wallpaper-based theme generator for Hyprland/Omarchy'
arch=('any')
url='https://github.com/bjarneo/tema'
license=('MIT')
depends=('gjs' 'gtk4' 'libadwaita' 'imagemagick')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjarneo/tema/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('6d0107719db63331d98b79ac0a1e8db5dfb55885d367d44120c29c9edcf544a9')

package() {
    cd "tema-${pkgver}"

    # Install application source
    install -dm755 "${pkgdir}/usr/share/tema"
    cp -r src templates "${pkgdir}/usr/share/tema/"

    # Install executable wrapper
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/tema" <<'WRAPPER'
#!/bin/bash
cd /usr/share/tema || exit
exec gjs -m src/main.js "$@"
WRAPPER
    chmod 755 "${pkgdir}/usr/bin/tema"

    # Install desktop file
    install -Dm644 li.oever.tema.desktop "${pkgdir}/usr/share/applications/li.oever.tema.desktop"
}
