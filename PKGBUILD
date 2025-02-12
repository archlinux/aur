# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=sipgate-softphone
appimage="${pkgname}.AppImage"
pkgver=1.17.19
pkgrel=1
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

sha256sums=('e2760861cda8ffe4d12446f4f8419de0b16831e48e6f56a5e2f0f73af904cb88'
            '00bce97f5f393524a9ed5f6d2588f889d2ecfdac4d552634dec891ebed913fe7')
