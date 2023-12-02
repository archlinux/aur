pkgname=simpread-sync-appimage
pkgver=1.2.0
pkgrel=1
pkgdesc='SimpRead sync server'
arch=('x86_64')
url='https://simpread.pro'
license=()
options=("!strip")
depends=('fuse2')
provides=('simpread-sync-appimage')
conflicts=('simpread-sync-appimage')
source=(
    "https://github.com/a15355447898a/simpread-sync/releases/download/${pkgver}/simpread-sync-${pkgver}.AppImage"
)
sha512sums=(
    '53b1c426419f35bb1a99c9995f84240d875afc008fde6c1c58ef30916a90c7a977b7e265259c0bd4f372e88623b5586ebfc25a398ffecf47465b2cacd1a047e3'
)

_installdir=/opt/simpread-sync

prepare() {
    chmod a+x ./simpread-sync-${pkgver}.AppImage
    ./simpread-sync-${pkgver}.AppImage --appimage-extract >/dev/null
    mv "squashfs-root/simpread-sync_project_workflow.png" "squashfs-root/simpread-sync.png"
    mv "squashfs-root/simpread-sync_project_workflow.desktop" "squashfs-root/simpread-sync.desktop"
    sed -i "s+AppRun+env ${_installdir}/simpread-sync.AppImage+" "squashfs-root/simpread-sync.desktop"
    sed -i "s+^Icon=.*+Icon=simpread-sync+" "squashfs-root/simpread-sync.desktop"
}

package() {
    install -Dm755 "simpread-sync-${pkgver}.AppImage" "${pkgdir}/${_installdir}/simpread-sync.AppImage"
    install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/simpread-sync_project_workflow.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/simpread-sync.png"
    install -Dm644 "squashfs-root/simpread-sync.desktop" "${pkgdir}/usr/share/applications/simpread-sync.desktop"
}
