pkgname=mrrss-appimage
pkgver=1.3.35
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
sha512sums=('286a577e5470997e5fd260a108dfc6c7104657555f5ed2068ffa7c5f270e0fb2fb4eea077ea883970fd14cc22dc954824426bf90139094b289cfc72bf66ba3e2')

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
