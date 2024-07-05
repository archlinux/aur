# Maintainer: huochenghai <huochenghai@gmail.com>
_basepkgname="syncclipboard"
pkgname=${_basepkgname}-desktop-bin
pkgver="0.7.4"
pkgrel=1
pkgdesc="跨平台剪贴板同步方案的客户端 / Client of Cross-Platform Cipboard Syncing Solution"
arch=("x86_64")
url="https://github.com/Jeric-X/SyncClipboard"
_githuburl="https://github.com/Jeric-X/SyncClipboard.Desktop"
depends=(glibc libxt libx11 fontconfig zlib libxtst gcc-libs libxinerama)
provides=("SyncClipboard.Desktop-${pkgver}")
conflicts=("${pkgname}" "${_basepkgname}" "${_basepkgname}-bin" "SyncClipboard.Desktop")
license=("MIT")
source=("${pkgname}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/SyncClipboard-${pkgver}_linux_self-contained.$CARCH.AppImage"
    'LICENSE::https://raw.githubusercontent.com/Jeric-X/SyncClipboard/master/LICENSE')
sha256sums=('09f9badf0695c7c6daea750c1b259a5ff6f5a0f7666ac5e2d586db9fe67a9751'
    'dfa38ed49c5407a5d8685c935703eb0bf8233db9f8c40700fd9059aff2a7e22f')

package() {
    chmod 755 ./${pkgname}-${pkgver}.AppImage
    ./${pkgname}-${pkgver}.AppImage --appimage-extract
    install -Dm644 "${srcdir}/squashfs-root/xyz.jericx.desktop.syncclipboard.desktop" -t "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/opt"
    cp -avR squashfs-root/ "${pkgdir}/opt/${pkgname}"
    ln -s /opt/${pkgname}/AppRun "${pkgdir}/usr/bin/SyncClipboard.Desktop.Default"
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
