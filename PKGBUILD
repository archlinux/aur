# $Id$
# Maintainer:  ElryDeveloper <ElryDeveloper at elry.moe>

pkgname=sipgate-desktop
appstart=AppRun
appimage="${pkgname}.AppImage"
pkgver=2024.1
pkgrel=1
pkgdesc='Make phone calls with the Sipgate CLINQ Client'
arch=('any')
url="https://www.sipgate.de/app"
license=('Other')
source=(
    "https://desktop.download.sipgate.com/sipgate%20CLINQ.AppImage"
    "sipgate-desktop.desktop"
)

package() {
    # Rename the file
    mv "sipgate%20CLINQ.AppImage" $appimage
    
    # Install AppImage
    chmod +x $appimage
    ./$appimage --appimage-extract  # extracts to squashfs-root
    DESTDIR="${pkgdir}/opt/${pkgname}/"
    mkdir -p $DESTDIR
    cp -r --no-preserve=mode,ownership squashfs-root/* $DESTDIR

    # Copy desktop file
    install -vDm 644 sipgate-desktop.desktop "${pkgdir}/usr/share/applications/sipgate-desktop.desktop"
    # Fix permissions
    chmod +x "${pkgdir}/opt/${pkgname}/${pkgname}"
    chmod +x "${pkgdir}/opt/${pkgname}/${appstart}"
}
sha256sums=('936a62a37f62c4e7320c0946210b3127da2f42188eb156ad36ac94da60d0c159'
            '5623875b72fb70b0924f2394d73dde23bd6636eae02b989b3a73f170e149f4c3')
