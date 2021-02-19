#Maintainer: Lukas Erhard <luerhard@googlemail.com>

pkgname=remarkable-client
pkgver=1.0.0
pkgrel=1
arch=("any")
license=("unknown")
url="https://remarkablewiki.com/tips/client?s[]=linux"
pkgdesc="This is a Linux version of the reMarkable Desktop Client. As far as I know, the development has been discontinued, but it still works. Adding files is as simple as dragging them onto the window."

depends=('qt5-svg' 'qt5-websockets' 'karchive' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-graphicaleffects')
#depends=('libqt5quick5')
source=('remarkable-linux-client.deb::https://drive.google.com/uc?id=1x_KhRp0_qufjnOO-pyDM1MAhRjeQeJTK')
sha256sums=('ecc6df114778e6d757fd5c2b9516f23ada56f6a3cd4153a8b967688dbbc8d805')

prepare() {
    ar x remarkable-linux-client.deb data.tar.xz
    tar -xf data.tar.xz
    DESKTOP_ENTRY="[Desktop Entry]
    Name=ReMarkable Client
    Version=1.0
    Comment=Unofficial reMarkable tablet linux Client
    Exec=/usr/bin/reMarkable
    Terminal=false
    Type=Application
    Categories=Science;Office;Utility
    "
    echo "$DESKTOP_ENTRY" > remarkable.desktop
}

package() {

    install -D -m664 "${srcdir}/remarkable.desktop" "${pkgdir}/usr/share/applications/remarkable.desktop"
    install -D -m755 "${srcdir}/usr/bin/reMarkable" "${pkgdir}/usr/bin/reMarkable"
    install -D -m755 "${srcdir}/usr/lib/libpdfium.so.1" "${pkgdir}/usr/lib/libpdfium.so.1"
}
