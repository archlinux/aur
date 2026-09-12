pkgname=mrrss-appimage
pkgver=1.3.34
pkgrel=1
pkgdesc='一个现代化、跨平台且免费的 AI RSS 阅读器.'
arch=('x86_64')
url='https://github.com/WCY-dt/MrRSS'
license=()
options=("!strip")
depends=('fuse2' 'hicolor-icon-theme' 'zlib' 'webkitgtk-6.0')
source=(
  "https://github.com/WCY-dt/MrRSS/releases/download/v${pkgver}/MrRSS-${pkgver}-linux-amd64.AppImage"
)
sha512sums=('15ea679aac24a7a561d6de67b335f42afeda05222730cff9009d27201a2d431910d4b4878779bd4f77c214a300ae0f76e109bca1ab3aa54777f1a03d6647ccf6')

_installdir=/opt/mrrss

prepare() {
  chmod a+x ./MrRSS-${pkgver}-linux-amd64.AppImage
  ./MrRSS-${pkgver}-linux-amd64.AppImage --appimage-extract >/dev/null
  sed -i "s+Exec=MrRSS+Exec=env ${_installdir}/MrRSS.AppImage+" "squashfs-root/MrRSS.desktop"
  sed -i 's#Icon=MrRSS#Icon=/usr/share/icons/hicolor/apps/MrRSS.png#g' squashfs-root/MrRSS.desktop
}

package() {
  install -Dm755 "MrRSS-${pkgver}-linux-amd64.AppImage" "${pkgdir}/${_installdir}/MrRSS.AppImage"
  install -Dm644 "squashfs-root/MrRSS.png" "${pkgdir}/usr/share/icons/hicolor/apps/MrRSS.png"
  install -Dm644 "squashfs-root/MrRSS.desktop" "${pkgdir}/usr/share/applications/MrRSS.desktop"
}
