# Maintainer: omarhanykasban <omarhanykasban706@gmail.com>

pkgname=mcpelauncher-appimage-cracked
_pkgname=${pkgname/appimage/ui-qt}
_pkgver=1.0.0-798
pkgver="1.0"
pkgrel=3
pkgdesc="Minecraft Bedrock Launcher for Linux"
arch=("x86_64" "armv7h" "aarch64")
url="https://github.com/caffeinepyroxene/mcbe-launcher-noauth"
license=('GPL-3.0-only' 'MIT')
depends=()
makedepends=('desktop-file-utils')
optdepends=('zenity: custom skin picker')
provides=(mcpelauncher-client mcpelauncher-ui mcpelauncher-appimage)
conflicts=(mcpelauncher-client mcpelauncher-ui mcpelauncher-appimage)
options=(!strip)
source_x86_64=("mcpelauncher-x86_64-v${pkgver}.AppImage::https://github.com/caffeinepyroxene/mcbe-launcher-noauth/releases/download/v${pkgver}/NoAuth-x86_64.AppImage")
source_armv7h=("mcpelauncher-armv7h-v${pkgver}.AppImage::https://github.com/caffeinepyroxene/mcbe-launcher-noauth/releases/download/v${pkgver}/NoAuth-Armhf.AppImage")
source_aarch64=("mcpelauncher-aarch64-v${pkgver}.AppImage::https://github.com/caffeinepyroxene/mcbe-launcher-noauth/releases/download/v${pkgver}/NoAuth-Arm64.AppImage")
sha512sums_x86_64=('9eef43748bbcdb63c5cdf742326ed5ca334129cebcdef80bdcb98b2eebc5ad193091c621cdbfdf201da40e42010bd109346281755e76e7a9d1d38972479ab1ca')
sha512sums_armv7h=('6dbd5222b7b4b808afbff0c8b69488673737f5c6127e09d5875f3924f7e4527238d29e6b2eba539d8727cc09d434ebc19bd12f7736ce638e3ff0335fdd265f06')
sha512sums_aarch64=('4f49ab620b7b630a48350b47ac504aff0232cc2dffada9265a0fcad9e3dd0f3e7d35743c82304f9e9debe37d5eae1fe188cc44de6975e52fa546911efc052b02')
_fileName="mcpelauncher-${CARCH}-v${pkgver}.AppImage"
_desktopFile="usr/share/applications/mcpelauncher-ui-qt.desktop"
_scalableIcon="usr/share/icons/hicolor/scalable/apps/mcpelauncher-ui-qt.svg"

prepare() {
    rm -rf "${srcdir}/squashfs-root"
    chmod +x "${srcdir}/${_fileName}"
    "${srcdir}/${_fileName}" --appimage-extract
    desktop-file-edit --set-key="Exec" --set-value="/opt/mcpelauncher-appimage-cracked/usr/bin/mcpelauncher-ui-qt %U" "${srcdir}/squashfs-root/${_desktopFile}"
}

package() {
    # Install icon & desktop
    install -Dm644 "${srcdir}/squashfs-root/${_scalableIcon}" "${pkgdir}/${_scalableIcon}"
    install -Dm644 "${srcdir}/squashfs-root/${_desktopFile}" "${pkgdir}/${_desktopFile}"
    # Install source
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin"
    cp -r "${srcdir}/squashfs-root/." "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    ln -s "/opt/${pkgname}/usr/bin/mcpelauncher-client" "${pkgdir}/usr/bin/mcpelauncher-client"
}