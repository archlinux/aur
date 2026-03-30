# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: Mrinmoy <mrinmoym@duck.com>
pkgname=serial-studio-bin
_pkgname=serial-studio-pro
pkgver=3.2.6
pkgrel=1
epoch=
pkgdesc="Open-source telemetry dashboard. Supports UART, BLE, MQTT, Modbus, CAN Bus and more."
arch=("x86_64" "aarch64")
url="https://serial-studio.com"
license=()
groups=()
depends=(
    "e2fsprogs"
    "libglvnd"
    "qt6-declarative"
    "libgpg-error"
    "qt6-quick3d"
    "qt6-multimedia"
    "qt6-virtualkeyboard"
    "qt6-webengine"
    "qt6-5compat"
)
makedepends=()
checkdepends=()
optdepends=()
provides=(${_pkgname})
conflicts=(${_pkgname})
replaces=()
backup=()
options=(!debug)
install=
changelog=
source_x86_64=(${_pkgname}-${CARCH}-${pkgver}-${pkgrel}.AppImage::https://github.com/Serial-Studio/Serial-Studio/releases/download/v${pkgver}/Serial-Studio-Pro-${pkgver}-Linux-x64.AppImage)
source_aarch64=(${_pkgname}-${CARCH}-${pkgver}-${pkgrel}.AppImage::https://github.com/Serial-Studio/Serial-Studio/releases/download/v${pkgver}/Serial-Studio-Pro-${pkgver}-Linux-arm64.AppImage)
noextract=()
sha256sums_x86_64=("SKIP")
sha256sums_aarch64=("SKIP")
validpgpkeys=()

prepare() {
    ./${_pkgname}-${CARCH}-${pkgver}-${pkgrel}.AppImage --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/usr/bin"
    install -dm644 "${pkgdir}/opt/${_pkgname}"
    install -dm644 "${pkgdir}/usr/share/applications"
    install -dm644 "${pkgdir}/usr/share/icons/hicolor/scalable/apps"

    mv squashfs-root/* "${pkgdir}/opt/${_pkgname}"
    ln -s "${pkgdir}/opt/${_pkgname}/serial-studio-pro.desktop" "${pkgdir}/usr/share/applications/serial-studio-pro.desktop"
    ln -s "${pkgdir}/opt/${_pkgname}/serial-studio-pro.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/serial-studio-pro.svg"
    ln -s "${pkgdir}/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"
}
