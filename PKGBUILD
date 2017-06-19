# Maintainer:  Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=firewatch-gog
pkgver=1.06_2.4.0.5
_gogver=2.4.0.5
pkgrel=1
pkgdesc="Firewatch is a single-player first-person mystery set in the Wyoming wilderness."
arch=('x86_64')
url="http://www.redbarrelsgames.com/"
license=('custom: commercial')
source=("local://gog_firewatch_${_gogver}.sh"
        gog_com-Firewatch_1.desktop)
sha256sums=("eb24695500ff3d04c13ef2ff54dff013c9a51074d340569f33a36c2a1304f0f6"
            "8039148538da31d0e8cb7af51c5df51bdccddcfdedf8fa276deeca22094b5d92")
# Prevent compressing final package
PKGEXT='.pkg.tar'

package() {
    mkdir -p "${pkgdir}/opt/firewatch/"

    # Launcher and Data
    cp -Ral "${srcdir}/data/noarch/"* "${pkgdir}/opt/firewatch"

    # Install Binaries/Launchers
    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/firewatch/game/fw.${CARCH}" \
          "${pkgdir}/usr/bin/firewatch"

    # Desktop Integration
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    ln -s "/opt/firewatch/game/fw_Data/Resources/UnityPlayer.png" \
          "${pkgdir}/usr/share/pixmaps/firewatch.png"
    install -Dm644 "${srcdir}/gog_com-Firewatch_1.desktop" "${pkgdir}/usr/share/applications/firewatch.desktop"

    # Permissions
    find "${pkgdir}/opt/firewatch" -type d -exec chmod 755 {} \;
    find "${pkgdir}/opt/firewatch" -type f -exec chmod 644 {} \;
    chmod 755 "${pkgdir}/opt/firewatch/game/fw.${CARCH}"
}
