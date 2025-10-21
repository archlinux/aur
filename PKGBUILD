# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hula-bin
_pkgname=HuLa
pkgver=3.0.0
pkgrel=1
pkgdesc="🍀A desktop instant messaging app built on Tauri+Vue3 (not just instant messaging)(Prebuilt version)一个基于 Tauri、Vite 5、Vue 3 和 TypeScript 构建的即时通讯系统"
arch=('x86_64')
url="https://hulaspark.com/"
_ghurl="https://github.com/HuLaSpark/HuLa"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'alsa-lib'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.${CARCH}.rpm")
sha256sums=('27854a91200c199863bd731b702d78fe9286d38a35748604f4539b0f7affd845')
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/usr/lib/${_pkgname}/tray/icon.png" -t "${pkgdir}/usr/lib/${_pkgname}/tray"
    _icon_sizes=(32x32 128x128 256x256@2 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
