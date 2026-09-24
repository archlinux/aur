# Maintainer: Kanehekili <kanehekili.media@gmail.com>
pkgname=mediainfogui
pkgver=1.3.1
pkgrel=2
pkgdesc="GUI for MediaInfo data — Qt6, GTK3 and GTK4"
url="https://github.com/kanehekili/MediaInfoGui"
license=('GPL-2.0-or-later')
depends=('mediainfo')
optdepends=('python-pyqt6: Qt6 interface' 'python-gobject: GTK3/GTK4 interface' 'ffmpeg: MPEG-TS program info')
arch=('x86_64' 'aarch64')
source=(https://github.com/kanehekili/MediaInfoGui/releases/download/1.3.1/MediaInfoGui1.3.1.tar)
md5sums=(f2de623b28f5bf009c6a10c96ec83fbc)

package() {
  cd "${srcdir}/MediaInfoGui"

  install -Dm 644 *.py            -t "${pkgdir}/opt/mediainfogui"
  install -Dm 755 MediaInfoGui.py -t "${pkgdir}/opt/mediainfogui"
  install -Dm 644 *.png           -t "${pkgdir}/opt/mediainfogui"

  # only the toolkit-neutral entry reaches the menu - the app detects the UI.
  # The MediaInfoGui*.desktop variants are shipped in the tar for install.sh
  install -Dm 644 MediaInfoGui.desktop -t "${pkgdir}/usr/share/applications"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/mediainfogui/MediaInfoGui.py" "${pkgdir}/usr/bin/mediainfogui"
}
