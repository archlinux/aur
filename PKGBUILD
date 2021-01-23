# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: david0

pkgname=reaper-bin
pkgver=6.21
pkgrel=1
conflicts=(reaper)

pkgdesc="Digital Audio Workstation"
url="http://www.reaper.fm"
arch=('x86_64')
license=('custom')

depends=('gtk3' 'desktop-file-utils' 'xdg-utils')
optdepends=('jack' 'pulseaudio')

source=("http://reaper.fm/files/6.x/reaper${pkgver//.}_linux_x86_64.tar.xz")
sha256sums=('6d976b84252dd90d0fbec9446f5cbabd1e1aa61f5fdf63cf043ec59c9d74db86')

package() {
  XDG_DATA_HOME="${srcdir}/desktop" sh "${srcdir}/reaper_linux_x86_64/install-reaper.sh" --install "${pkgdir}/opt" --integrate-user-desktop

  sed -i 's#^Exec.*#Exec="/opt/REAPER/reaper" %F#g' "${srcdir}/desktop/applications/cockos-reaper.desktop"
  install -D -m644 "${srcdir}/desktop/applications/cockos-reaper.desktop" "${pkgdir}/usr/share/applications/cockos-reaper.desktop"
  install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -m644 "${srcdir}/desktop/icons/hicolor/256x256/apps/"*.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -D -m644 "${srcdir}/desktop/mime/packages/application-x-reaper.xml" "${pkgdir}/usr/share/mime/packages/application-x-reaper.xml"

  rm "${pkgdir}/opt/REAPER/uninstall-reaper.sh"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/REAPER/reaper "${pkgdir}/usr/bin/reaper"
  mkdir -p "${pkgdir}/usr/share/licenses/reaper"
  ln -s /opt/REAPER/license.txt "${pkgdir}/usr/share/licenses/reaper/LICENSE"
}

