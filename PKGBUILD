# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=donutbrowser-bin
_pkgname=Donut
pkgver=0.34.0
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
sha256sums_aarch64=('c488cd16daf0605b562fb84593ca82c60a64d7107320b9d50cd7c522dd527334')
sha256sums_x86_64=('5dbe4c829a323a9357a83c86e617c93879b257a12b667a11fe9a768ac207813c')
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
