# $Id$
# Maintainer:  ElryDeveloper <ElryDeveloper at elry.moe>

pkgname=sipgate-desktop
appimage="${pkgname}.AppImage"
pkgver=2024
pkgrel=2
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
    chmod +x "${pkgdir}/opt/${pkgname}/chrome-sandbox"
    chmod +x "${pkgdir}/opt/${pkgname}/chrome_crashpad_handler"
}
sha256sums=('936a62a37f62c4e7320c0946210b3127da2f42188eb156ad36ac94da60d0c159'
            'c1c0104c45f34392f04317ec7597926cdd697ebeffdcc1b64ee4cdd0fa158221')
sha256sums=('69860ea5a9017b49f6837ba6313a716801171186bab61045dbe5688a624a171f'
            'c1c0104c45f34392f04317ec7597926cdd697ebeffdcc1b64ee4cdd0fa158221')
