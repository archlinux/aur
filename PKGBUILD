
# Maintainer: SlotSun <slot_sun@outlook.com>
pkgname=slive-bin
_pkgname=slive
pkgver=1.8.7
pkgrel=1
pkgdesc="基于Flutter的聚合直播软件，支持多平台直播源聚合与观看。"
arch=('x86_64' 'aarch64')
url="https://github.com/SlotSun/dart_simple_live"
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!debug' '!strip')
depends=('gtk3')
source_x86_64=("Slive-x86_64-linux.zip::https://github.com/SlotSun/dart_simple_live/releases/download/v1.8.7/Slive-x86_64-linux.zip" "https://raw.githubusercontent.com/SlotSun/dart_simple_live/refs/tags/v1.8.7/simple_live_app/assets/io.github.SlotSun.Slive.desktop")
source_aarch64=("Slive-aarch64-linux.zip::https://github.com/SlotSun/dart_simple_live/releases/download/v1.8.7/Slive-aarch64-linux.zip" "https://raw.githubusercontent.com/SlotSun/dart_simple_live/refs/tags/v1.8.7/simple_live_app/assets/io.github.SlotSun.Slive.desktop")
sha256sums_x86_64=('2a6caee8e8684ed4c715d0724f10b358b9512d2b03fbdd3314dcdbc7a5eed637' 'SKIP')
sha256sums_aarch64=('SKIP' 'SKIP')


package() {
    local app_id="io.github.SlotSun.Slive"

    install -d "${pkgdir}/opt/Slive" "${pkgdir}/usr/bin"
    install -Dm755 "${app_id}" "${pkgdir}/opt/Slive/${app_id}"
    
    cp -a data lib "${pkgdir}/opt/Slive/"
    ln -s "/opt/Slive/${app_id}" "${pkgdir}/usr/bin/${app_id}"

    # 安装图标和桌面文件
    install -Dm644 data/flutter_assets/assets/images/logo.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${app_id}.png"
	install -Dm644 data/flutter_assets/assets/images/logo.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${app_id}.png"
    install -Dm644 "${app_id}.desktop" -t "${pkgdir}/usr/share/applications/"
}