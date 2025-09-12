# Maintainer: Alex D'Andrea <alex [at] dandrea dot io>
# Contributor: zhullyb <zhullyb [at] outlook dot com>

pkgname=onedrivegui
_pkgname=OneDriveGUI
pkgver=1.2.2
_commit=eb4c39375e04b02e669a7826c9d12174c6a3f08c
pkgrel=1
pkgdesc="A simple GUI for OneDrive Linux client, with multi-account support."
license=("GPL-3.0-or-later")
depends=("pyside6" "python-requests" "onedrive-abraunegg>=2.5.6" "qt6-webengine")
makedepends=("git")
conflicts=("onedrivegui-git")
provides=("onedrivegui")
arch=("any")
url="https://github.com/bpozdena/${_pkgname}"
source=("${_pkgname}::git+${url}.git#commit=$_commit" "onedrivegui.desktop")

sha256sums=('66fc45e90ebc3d5c2cc98c4cfda879f0e8c8222d57adf127f8378e3d77e21ea0'
            'c531f57c3c8424f265c0aad2e93260eab071d066d75de2f7eebb47e41c644267')

package(){
    cd "${_pkgname}"
    mkdir -p "${pkgdir}/usr/lib/OneDriveGUI"
    mkdir -p "${pkgdir}/usr/bin"
    cp -r src/{resources,ui,settings,utils} "${pkgdir}/usr/lib/OneDriveGUI"
    install -Dm644 src/resources/images/OneDriveGUI.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/OneDriveGUI.png"
    install -Dm644 "${srcdir}/onedrivegui.desktop" "${pkgdir}/usr/share/applications/onedrivegui.desktop"
    install -Dm755 src/*.py "${pkgdir}/usr/lib/OneDriveGUI/"
    ln -sf /usr/lib/OneDriveGUI/OneDriveGUI.py "${pkgdir}/usr/bin/onedrivegui"
}
