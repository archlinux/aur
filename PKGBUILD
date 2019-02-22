# Maintainer: Genesis <tofupedia.fr@gmail.com>

# To disable the popup asking for system integration at each startup :
# `touch $HOME/.local/share/appimagekit/no_desktopintegration`

pkgname=ankama-launcher
pkgver=2.8.22
pkgrel=1
pkgdesc='A multi-game portal for all Ankama games.'
url='https://www.ankama.com/en/launcher'

arch=('i686' 'x86_64')
license=('custom:Ankama License')
depends=('zlib')
optdepends=('wine: to play Dofus'
            'java-environment: to play Wakfu')
options=('!strip')
source=('ankama-launcher.desktop.patch')
source_i686=('https://ankama.akamaized.net/zaap/installers/production/Ankama%20Launcher-Setup-i386.AppImage')
source_x86_64=('https://ankama.akamaized.net/zaap/installers/production/Ankama%20Launcher-Setup-x86_64.AppImage')
md5sums=('f4a3bd087a326c9d31f6c945e7ddbe0b')
md5sums_i686=('43582538704d96540145186ea8626e1b')
md5sums_x86_64=('95d8a625e166227e82e8c586fcd86bdf')

[[ "$CARCH" == "i686" ]] && LARCH='i386'
[[ "$CARCH" == "x86_64" ]] && LARCH='x86_64'

prepare() {
    cd "${srcdir}"
    mv "Ankama%20Launcher-Setup-${LARCH}.AppImage" "ankama-launcher.AppImage"
    7z e "${srcdir}/ankama-launcher.AppImage" "zaap.desktop"
    7z e "${srcdir}/ankama-launcher.AppImage" "usr/share/icons/hicolor/128x128/apps/zaap.png"

    mv "zaap.desktop" "ankama-launcher.desktop"
    mv "zaap.png" "ankama-launcher.png"

    patch -Np0 <../ankama-launcher.desktop.patch
}

package() {
    install -Dm755 "ankama-launcher.AppImage" "${pkgdir}/opt/appimages/ankama-launcher.AppImage"
    install -Dm644 "ankama-launcher.desktop"  "${pkgdir}/usr/share/applications/ankama-launcher.desktop"
    install -Dm644 "ankama-launcher.png"      "${pkgdir}/usr/share/pixmaps/ankama-launcher.png"
}
