# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=slimjet
pkgname="${_pkgname}-beta-bin"
_appname="flashpeak-${_pkgname}"
pkgver=43.0.4.0
_libffmpegver=0.89.0
pkgrel=1
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="https://www.slimjet.com"
_dlurl="https://www.slimjetbrowser.com"
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt"
license=('LicenseRef-freeware')
depends=(
    'libxcb'
    'alsa-lib'
    'nspr'
    'nss'
    'at-spi2-core'
    'libxrandr'
    'libxcomposite'
    'libxdamage'
)
optdepends=(
    'kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs'
    'ttf-liberation: fix fonts for some PDFs'
)
conflicts=(
    "${_pkgname}35"
    "${_pkgname}"
    "${pkgname%-bin}"
)
provides=("${_pkgname}")
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}_amd64.deb::${_dlurl}/beta/${_pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/releases/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
)
sha256sums=('d8a7aac23decea233ef08f891841901309fe496b4764a806569ed9a9edad7adf'
            'b9a08666c3d0ac0d5d97dd08a9183b4e058c272400181045fea3414d28551dc6')
build() {
    bsdtar -xf "${srcdir}/data."*
    bsdtar -xf "${srcdir}/control."*
    find "${srcdir}" -type d -exec chmod 755 {} \;
    rm -rf "${srcdir}/opt/.gitkeep"
}
package() {
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm755 -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${_pkgname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
    install -Dm644 "${srcdir}/libffmpeg.so" -t "${pkgdir}/opt/${_pkgname}"
    install -Dm644 "${srcdir}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${_pkgname}.xml" -t "${pkgdir}/usr/share/gnome-control-center/default-apps".
    install -Dm644 "${srcdir}/usr/share/menu/${_pkgname}.menu" -t "${pkgdir}/usr/share/menu"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.xpm" -t "${pkgdir}/usr/share/pixmaps"
}