# Maintainer: huochenghai <huochenghai@gmail.com>
_basepkgname="syncclipboard"
pkgname=${_basepkgname}-desktop-bin
pkgver="3.1.0"
pkgrel=1
pkgdesc="跨平台剪贴板同步、历史记录管理工具 / Cross-platform cipboard syncing, history management tool"
arch=("x86_64")
url="https://github.com/Jeric-X/SyncClipboard"
_githuburl="https://github.com/Jeric-X/SyncClipboard/"
depends=(glibc libxt libx11 fontconfig zlib libxtst gcc-libs libxinerama hicolor-icon-theme)
provides=("SyncClipboard.Desktop-${pkgver}")
conflicts=("${pkgname}" "${_basepkgname}" "${_basepkgname}-bin" "SyncClipboard.Desktop")
license=("MIT")

source=("${pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/SyncClipboard_linux_x64.AppImage"
    'LICENSE::https://raw.githubusercontent.com/Jeric-X/SyncClipboard/master/LICENSE')
sha256sums=('6b0b4941655976fc5abbcb7d8182a3eddfe08acb51aa43466b92c6fe478be4ed'
    'dfa38ed49c5407a5d8685c935703eb0bf8233db9f8c40700fd9059aff2a7e22f')

package() {
    chmod 755 ./${pkgname}-${pkgver}.AppImage
    ./${pkgname}-${pkgver}.AppImage --appimage-extract
    install -Dm644 "${srcdir}/squashfs-root/xyz.jericx.desktop.syncclipboard.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/xyz.jericx.desktop.syncclipboard.svg" -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt"
    cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
    ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/SyncClipboard.Desktop.Default"
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
