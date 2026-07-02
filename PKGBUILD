# Maintainer: Stefan Gruenberger <stefan.gruenberger at gmail dot com>
# Contributor: cheapl <cheapl@icloud.com>

pkgname=onedrivegui
_pkgname=OneDriveGUI
pkgver=1.3.2
pkgrel=1
pkgdesc="A simple GUI for OneDrive Linux client, with multi-account support."
license=("GPL-3.0-or-later")
depends=("pyside6" "python-requests" "onedrive-abraunegg>=2.5.6" "qt6-webengine")
makedepends=("git")
conflicts=("onedrivegui-git")
provides=("onedrivegui")
arch=("any")
url="https://github.com/bpozdena/${_pkgname}"
source=("git+$url.git#tag=v$pkgver" "onedrivegui.desktop")

sha256sums=('SKIP'
  '96ca50d72d323c02a23946684c3a73a599d5a4d5ab3e1dbc3d668036f2ed511d')

package() {
  cd "${_pkgname}"
  mkdir -p "${pkgdir}/usr/lib/OneDriveGUI"
  mkdir -p "${pkgdir}/usr/bin"
  cp -r src/{resources,ui,settings,utils} "${pkgdir}/usr/lib/OneDriveGUI"
  install -Dm644 src/resources/images/OneDriveGUI.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/onedrivegui.png"
  install -Dm644 "${srcdir}/onedrivegui.desktop" "${pkgdir}/usr/share/applications/onedrivegui.desktop"
  install -Dm755 src/*.py "${pkgdir}/usr/lib/OneDriveGUI/"
  ln -sf /usr/lib/OneDriveGUI/OneDriveGUI.py "${pkgdir}/usr/bin/onedrivegui"
}
