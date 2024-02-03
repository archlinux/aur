# Maintainer: Genesis <tofupedia.fr@gmail.com>

pkgname=ankama-launcher
pkgver=3.12.6
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
sha512sums_x86_64=('8b68219acc71238e4c8dec81c69643f414d35551bf8313b9619472dac2203890f3d28a0259d6bf940bc6215e04e1c5456fb47f0e99f722c63ac25fef88bc8a7a')

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
