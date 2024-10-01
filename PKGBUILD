# Maintainer: Alex D'Andrea <alex [at] dandrea dot io>
# Contributor: zhullyb <zhullyb [at] outlook dot com>

pkgname=onedrivegui
_pkgname=OneDriveGUI
pkgver=1.1.1
_commit=ff7edf15141bc629dd5e778d772113feb8b48077
pkgrel=1
pkgdesc="A simple GUI for OneDrive Linux client, with multi-account support."
license=("GPL-3.0-or-later")
depends=("pyside6" "python-requests" "onedrive-abraunegg>=2.5.0" "qt6-webengine")
makedepends=("git")
conflicts=("onedrivegui-git")
provides=("onedrivegui")
arch=("any")
url="https://github.com/bpozdena/${_pkgname}"
source=("${_pkgname}::git+${url}.git#commit=$_commit" "onedrivegui.desktop")

sha256sums=('fd2e57c992534eaab376a120d5be2ca80523fb37c8b557eff480d52db6d85bb7'
            'c531f57c3c8424f265c0aad2e93260eab071d066d75de2f7eebb47e41c644267')

package(){
    cd "${_pkgname}"
    mkdir -p "${pkgdir}/usr/lib/OneDriveGUI"
    mkdir -p "${pkgdir}/usr/bin"
    cp -r src/{resources,ui} "${pkgdir}/usr/lib/OneDriveGUI"
    install -Dm644 src/resources/images/OneDriveGUI.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/OneDriveGUI.png"
    install -Dm644 "${srcdir}/onedrivegui.desktop" "${pkgdir}/usr/share/applications/onedrivegui.desktop"
    install -Dm755 src/OneDriveGUI.py "${pkgdir}/usr/lib/OneDriveGUI/OneDriveGUI.py"
    ln -sf /usr/lib/OneDriveGUI/OneDriveGUI.py "${pkgdir}/usr/bin/onedrivegui"
}
