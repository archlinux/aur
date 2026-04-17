pkgname=pulseview-slogic-appimage
pkgver=230811
pkgrel=2
pkgdesc='基于 Qt 的 sigrok 逻辑分析仪图形用户界面(slogic定制版,仅适用于slogic的逻辑分析仪)'
arch=('x86_64')
url='https://wiki.sipeed.com/hardware/zh/logic_analyzer/combo8/use_logic_function.html'
license=()
options=("!strip")
depends=('fuse2')
source=(
  "https://github.com/a15355447898a/pulseview-slogic/releases/download/260122/pulseview-slogic-${pkgver}-x86_64.AppImage"
)
sha512sums=('dbfe7b3e703fa1c97d7f5a67ce27f65f377dbd9c0af3f2aa97d9aabcf008ea9dd1456505b676028b074f13554bab6eaa34cab22cd6fb4c8dc56d205157f2930f')

_installdir=/opt/pulseview-slogic

prepare() {
  chmod a+x "pulseview-slogic-${pkgver}-x86_64.AppImage"
  ./"pulseview-slogic-${pkgver}-x86_64.AppImage" --appimage-extract >/dev/null
  sed -i 's#^Name=PulseView$#Name=PulseView SLogic#' "squashfs-root/usr/share/applications/org.sigrok.PulseView.desktop"
  sed -i 's#^Exec=pulseview$#Exec=/opt/pulseview-slogic/pulseview-slogic.AppImage#' "squashfs-root/usr/share/applications/org.sigrok.PulseView.desktop"
  sed -i 's#^Icon=pulseview$#Icon=pulseview-slogic#' "squashfs-root/usr/share/applications/org.sigrok.PulseView.desktop"
}

package() {
  install -Dm755 "pulseview-slogic-${pkgver}-x86_64.AppImage" "${pkgdir}/${_installdir}/pulseview-slogic.AppImage"
  install -Dm644 "squashfs-root/usr/share/icons/hicolor/48x48/apps/pulseview.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/pulseview-slogic.png"
  install -Dm644 "squashfs-root/usr/share/icons/hicolor/scalable/apps/pulseview.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/pulseview-slogic.svg"
  install -Dm644 "squashfs-root/usr/share/applications/org.sigrok.PulseView.desktop" "${pkgdir}/usr/share/applications/pulseview-slogic.desktop"
}
