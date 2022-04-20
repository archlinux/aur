# Maintainer: bpozdena <https://github.com/bpozdena>

pkgname=onedrivegui-git
pkgver=0.1.0.r69.d3bdaca
pkgrel=2
pkgdesc="A simple GUI for OneDrive Linux client, with multi-account support."
license=("GPL")
depends=("pyside6" "python-requests" "onedrive-abraunegg" "qt6-webengine")
makedepends=("git")
conflicts=("onedrivegui")
provides=("onedrivegui")
arch=("any")
url="https://github.com/bpozdena/OneDriveGUI"
source=("git+${url}" "onedrivegui.desktop")
sha256sums=('SKIP'
            '4fb57703c2e8115793ad6b83f33203bed11bf29948bccb68d74011a844e799ff')
_lastver=0.1.0

pkgver(){
    cd "${srcdir}/OneDriveGUI"
    echo ${_lastver}.r$(git rev-list --count HEAD).$(git describe --always)
}
package(){
    cd "${srcdir}/OneDriveGUI"
    mkdir -p "${pkgdir}/usr/lib/OneDriveGUI"
    mkdir -p "${pkgdir}/usr/bin"
    cp -r src/{resources,ui} "${pkgdir}/usr/lib/OneDriveGUI"
    install -Dm644 src/resources/images/OneDriveGUI.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/OneDriveGUI.png"
    install -Dm644 "${srcdir}/onedrivegui.desktop" "${pkgdir}/usr/share/applications/onedrivegui.desktop"
    install -Dm755 src/OneDriveGUI.py "${pkgdir}/usr/lib/OneDriveGUI/OneDriveGUI.py"
    ln -sf /usr/lib/OneDriveGUI/OneDriveGUI.py "${pkgdir}/usr/bin/onedrivegui"
}
