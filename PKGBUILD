# Maintainer: Dilial <tu@email.com>
pkgname=ventoyisomanager-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="A Tauri-based application for managing Ventoy ISO images"
arch=('x86_64')
url="https://github.com/Dilial/VentoyISOManager"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'glib2' 'cairo' 'pango' 'gdk-pixbuf2')
provides=('ventoyisomanager')
conflicts=('ventoyisomanager-git')
options=('!strip')

_appimage="VentoyISOManager_${pkgver}_amd64.AppImage"

source=("${_appimage}::https://github.com/Dilial/VentoyISOManager/releases/download/v${pkgver}/${_appimage}")
sha256sums=('3a9de83332d444b824a114d4050037166e63e3cd7f6d78593625d2916312e2ae')

prepare() {
    chmod +x "${srcdir}/${_appimage}"
    "${srcdir}/${_appimage}" --appimage-extract
}

package() {
    local _src="${srcdir}/squashfs-root"

    # Binario
    install -Dm755 "${_src}/usr/bin/ventoyisomanager" \
        "${pkgdir}/usr/bin/ventoyisomanager"

    # Desktop entry
    install -Dm644 "${_src}/usr/share/applications/ventoyisomanager.desktop" \
        "${pkgdir}/usr/share/applications/ventoyisomanager.desktop"

    # Iconos (los tres tamaños disponibles)
    install -Dm644 "${_src}/usr/share/icons/hicolor/32x32/apps/ventoyisomanager.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/ventoyisomanager.png"
    install -Dm644 "${_src}/usr/share/icons/hicolor/128x128/apps/ventoyisomanager.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/ventoyisomanager.png"
    install -Dm644 "${_src}/usr/share/icons/hicolor/256x256@2/apps/ventoyisomanager.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256@2/apps/ventoyisomanager.png"
}
