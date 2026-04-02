pkgname=nosub-appimage
pkgver=3.1.2
pkgrel=1
pkgdesc='Nosub是一个字幕软件，以字幕编辑，调整为核心，支持离线语音识别，已经全面接入LLM大模型做字幕处理。'
arch=('x86_64')
url='https://github.com/patui/Nosub'
license=()
options=("!strip")
depends=('fuse2')
source=(
  "https://github.com/patui/Nosub/releases/download/${pkgver}/Nosub-v${pkgver}-x86_64.AppImage"
)
sha512sums=('52de155ee4324ff1106ba42f160f6b8ee8e5766ca38703f3779ffff99143acd0a80607f9a500b49843bad9decbf6c82f252205a75d65dae0db8528faf8cb8977')

_installdir=/opt/nosub

prepare() {
  chmod a+x "./Nosub-v${pkgver}-x86_64.AppImage"
  ./Nosub-v${pkgver}-x86_64.AppImage --appimage-extract >/dev/null
  sed -i "s#^Exec=.*#Exec=${_installdir}/Nosub.AppImage --no-sandbox %U#" "squashfs-root/Nosub.desktop"
  sed -i 's#^Icon=.*#Icon=/usr/share/icons/hicolor/256x256/apps/nosub.png#' "squashfs-root/Nosub.desktop"
}

package() {
  install -Dm755 "Nosub-v${pkgver}-x86_64.AppImage" "${pkgdir}/${_installdir}/Nosub.AppImage"
  install -Dm644 "squashfs-root/nosub.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/nosub.png"
  install -Dm644 "squashfs-root/Nosub.desktop" "${pkgdir}/usr/share/applications/Nosub.desktop"
}
