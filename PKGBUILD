# Maintainer: Shaun McCloud <smccloud@smccloud.com>

pkgname=hackman3d-control-deck
pkgbase=hackman3d-control-deck
pkgver=1.5.6.r7
pkgrel=1
pkgdesc="HackMan3D Control Deck (HCD) is a family of programmable desktop controllers."
arch=('x86_64')
url="https://github.com/HackMan3D/Hackman3D-Control-Deck/tree/main"
license=('Creative Commons (4.0 International License)')
provides=("hackman3d-control-deck")
conflicts=("hackman3d-control-deck")
options=(!strip !zipman !debug)
source=("${pkgname}-${pkgver}.AppImage::https://github.com/HackMan3D/Hackman3D-Control-Deck/releases/download/v1.5.6/HackMan3D-Control-Deck-Linux-x86_64-1.5.6-r7.AppImage")
sha256sums=('7be05d74a89bc92be0f0ffc5c7a5d6f494876522018f9156d47bf19b6d5d3ef7')

prepare() {
    chmod +x ${pkgname}-${pkgver}.AppImage
  ./${pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
    cd "$srcdir/../"
    install -d ${pkgdir}/opt/${pkgname%}/
    cp -a ${srcdir}/squashfs-root/* ${pkgdir}/opt/${pkgname%}/
    rm -rf ${pkgdir}/opt/${pkgname%}/{hackman3d-control-deck.png}

    install -d $pkgdir/usr/bin
    ln -s /opt/${pkgname%}/AppRun ${pkgdir}/usr/bin/hackman3d-control-deck

    install -Dm644 ${srcdir}/squashfs-root/hackman3d-control-deck.desktop -t ${pkgdir}/usr/share/applications/
    sed -i 's|Exec=hackman3d-control-deck|Exec=/opt/hackman3d-control-deck/AppRun|g' ${pkgdir}/usr/share/applications/hackman3d-control-deck.desktop
    sed -i 's|Icon=hackman3d-control-deck|Icon=/opt/hackman3d-control-deck/hackman3d-control-deck.png|g' ${pkgdir}/usr/share/applications/hackman3d-control-deck.desktop
}
