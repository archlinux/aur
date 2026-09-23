# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=donutbrowser-bin
_pkgname=Donut
pkgver=0.31.2
pkgrel=1
pkgdesc="A powerful browser orchestrator that puts you in control of your browsing experience."
arch=(
    'aarch64'
    'x86_64'
)
url="https://donutbrowser.com/"
_ghurl="https://github.com/zhom/donutbrowser"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
install="${pkgname%-bin}.install"
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'xdotool'
    'libayatana-appindicator'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-1.x86_64.rpm")
sha256sums_aarch64=('3037f6097ddb4fa147b73f8e6906ebb3538db9af13f5a9e8799b465d0f15cb0f')
sha256sums_x86_64=('2fdf9b0cd2b644d465a6bb96021c112005b452143d5fb0b41a53288e611aa50d')
package() {
    install -Dm755 "${srcdir}/usr/bin/"* -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -a "${srcdir}/usr/lib/." "${pkgdir}/usr/lib"
    mv "${srcdir}/usr/share/icons/hicolor/256x256@2" "${srcdir}/usr/share/icons/hicolor/256x256"
    find "${srcdir}/usr/share/icons" -type f \( -name "*.png" -o -name "*.svg" \) \
        | while read -r _i; do
        _extension="${_i##*.}"
        _target_dir=$(dirname "${_i#$srcdir}")
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}