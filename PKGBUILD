# Maintainer: Genesis <tofupedia.fr@gmail.com>

# To disable the popup asking for system integration at each startup :
# `touch $HOME/.local/share/appimagekit/no_desktopintegration`

pkgname=ankama-launcher
pkgver=2.10.31
pkgrel=1
pkgdesc='A multi-game portal for all Ankama games.'
url='https://www.ankama.com/en/launcher'

arch=('i686' 'x86_64')
license=('custom:Ankama License')
depends=('zlib' 'bash')
makedepends=('p7zip')
optdepends=('wine: to play Dofus'
            'java-environment: to play Wakfu')
options=('!strip')
source=('ankama-launcher')
source_i686=("${pkgname}-${pkgver}-i686.AppImage::https://ankama.akamaized.net/zaap/installers/production/Ankama%20Launcher-Setup-i386.AppImage")
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://ankama.akamaized.net/zaap/installers/production/Ankama%20Launcher-Setup-x86_64.AppImage")
md5sums=('f86043ac6089eddc756942c15a555179')
md5sums_i686=('64c1dd6b072d3d95b9c38bd6e60eec61')
md5sums_x86_64=('3793bfded627af12e6062895a4604649')

prepare() {
    cd "${srcdir}"
    mv "${pkgname}-${pkgver}-${CARCH}.AppImage" "ankama-launcher.AppImage"
    7z e "${srcdir}/ankama-launcher.AppImage" "zaap.desktop"
    7z e "${srcdir}/ankama-launcher.AppImage" "usr/share/icons/hicolor/128x128/apps/zaap.png"

    mv "zaap.desktop" "ankama-launcher.desktop"
    mv "zaap.png" "ankama-launcher.png"

    sed -i "s/^Exec=AppRun$/Exec=${pkgname}/" "ankama-launcher.desktop"
    sed -i "s/^Icon=zaap$/Icon=ankama-launcher/" "ankama-launcher.desktop"
}

package() {
    install -Dm755 "ankama-launcher.AppImage" "${pkgdir}/opt/appimages/ankama-launcher.AppImage"
    install -Dm755 "ankama-launcher"          "${pkgdir}/usr/bin/ankama-launcher"
    install -Dm644 "ankama-launcher.desktop"  "${pkgdir}/usr/share/applications/ankama-launcher.desktop"
    install -Dm644 "ankama-launcher.png"      "${pkgdir}/usr/share/pixmaps/ankama-launcher.png"
}
