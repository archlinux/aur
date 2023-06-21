# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=sipgate-softphone
appimage="${pkgname}.AppImage"
pkgver=1.17.3
pkgrel=2
pkgdesc='Make phone calls with the Sipgate softphone'
arch=('any')
url="https://www.sipgate.co.uk/softphone"
license=('Other')
source=(
    "https://sipgate-desktop-app.s3.eu-central-1.amazonaws.com/${appimage}"
    "sipgate.desktop"
)

package() {
    chmod +x $appimage
    ./$appimage --appimage-extract  # extracts to squashfs-root
    DESTDIR="${pkgdir}/opt/${pkgname}/"
    mkdir -p $DESTDIR
    cp -r --no-preserve=mode,ownership squashfs-root/* $DESTDIR

    # Copy desktop file
    install -vDm 644 sipgate.desktop "${pkgdir}/usr/share/applications/sipgate.desktop"
    # Fix permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"
}

sha256sums=('4f4382d944d6d0912de5b6de941946c5eae173c731349a32732556ebff76f386'
            '00bce97f5f393524a9ed5f6d2588f889d2ecfdac4d552634dec891ebed913fe7')
