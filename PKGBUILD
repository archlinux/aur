# Maintainer: Genesis <tofupedia.fr@gmail.com>

pkgname=ankama-launcher
pkgver=3.13.7
pkgrel=1
pkgdesc='A multi-game portal for all Ankama games.'
url='https://www.ankama.com/en/launcher'

arch=('x86_64')
license=('custom:Ankama License')
install='ankama-launcher.install'
depends=('zlib' 'bash' 'fuse')
makedepends=('p7zip')
optdepends=('wine: to play Dofus'
            'java-environment: to play Wakfu')
options=('!strip')
source=('ankama-launcher')
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://launcher.cdn.ankama.com/installers/production/Ankama%20Launcher-Setup-x86_64.AppImage")
sha512sums=('0b9d72c460dd22acc0d2d2b0ab312bc609501c8c7fb8eaef2bd93092fd4ac849152b0e9163253066536ea4169079e5bc424bea37ee005c48a2047721142f876b')
sha512sums_x86_64=('8dbf005c00cd79e1109fd51435d5f4939bdb650ba99948bb3610ea2a4eeaa6dcdfda8509825c5f12e75aeaef204dd83714a6ef48f66bcb0a149a0a5197e3df49')

prepare() {
    cd "${srcdir}"
    mv "${pkgname}-${pkgver}-${CARCH}.AppImage" "ankama-launcher.AppImage"
    7z e "${srcdir}/ankama-launcher.AppImage" "zaap.desktop"
    7z e "${srcdir}/ankama-launcher.AppImage" "usr/share/icons/hicolor/128x128/apps/zaap.png"

    mv "zaap.desktop" "ankama-launcher.desktop"
    mv "zaap.png" "ankama-launcher.png"

    sed -i "s/^Exec=.*$/Exec=${pkgname}/" "ankama-launcher.desktop"
    sed -i "s/^Icon=zaap$/Icon=ankama-launcher/" "ankama-launcher.desktop"
}

package() {
    install -dm775 -ggames "${pkgdir}/opt/ankama-launcher"
    install -Dm775 -ggames "ankama-launcher.AppImage" "${pkgdir}/opt/ankama-launcher/ankama-launcher.AppImage"
    install -Dm755 "ankama-launcher"                  "${pkgdir}/usr/bin/ankama-launcher"
    install -Dm644 "ankama-launcher.desktop"          "${pkgdir}/usr/share/applications/ankama-launcher.desktop"
    install -Dm644 "ankama-launcher.png"              "${pkgdir}/usr/share/pixmaps/ankama-launcher.png"
}
