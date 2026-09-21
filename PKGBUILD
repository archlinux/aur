pkgname=mrrss-appimage
pkgver=1.3.37
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
sha512sums=('0fe0034d7f6cdc985a7d4364692768645cd25af502618f21582c19a6d256df55285d92cb22a4d3ab81276239e2b01564fe7ae6f7e731a040714350efef16934a')

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
