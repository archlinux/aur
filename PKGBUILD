# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=slimjet
pkgname="${_pkgname}-beta-bin"
_appname="flashpeak-${_pkgname}"
pkgver=42.0.1.0
pkgrel=1
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt"
_libffmpegver=0.83.0
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="https://www.slimjet.com"
_downurl="https://www.slimjetbrowser.com"
license=('custom:freeware')
depends=(
    'libxcb'
    'at-spi2-core'
    'libxdamage'
    'libxcomposite'
    'pango'
    'libxkbcommon'
    'libxrandr'
    'alsa-lib'
    'libxext'
    'libcups'
    'nspr'
    'nss'
    'libdrm'
    'libxfixes'
    'expat'
    'libx11'
    'mesa'
    'cairo'
)
optdepends=(
    'kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs'
)
conflicts=(
    "${_pkgname}35"
    "${_pkgname}"
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}_amd64.deb::${_downurl}/beta/${_pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/releases/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
)
sha256sums=('9aee390395ac6483b1f9b782fc99174c39f99f353d102d74f891c0a1a0ed20f4'
            '17d330079d91920e75521e9255a68b2a1bcc7d8aa84090bdce518b7160ea65e2')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    bsdtar -xf "${srcdir}/control.tar.xz"
    find "${srcdir}" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt,usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}" "${pkgdir}/opt"
    ln -sf "/opt/${_pkgname}/${_appname}" "${pkgdir}/usr/bin/${_appname}"
    install -Dm644 "${srcdir}/libffmpeg.so" -t "${pkgdir}/opt/${_pkgname}"
    install -Dm644 "${srcdir}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/gnome-control-center/default-apps/${_pkgname}.xml" -t "${pkgdir}/usr/share/gnome-control-center/default-apps".
    install -Dm644 "${srcdir}/usr/share/menu/${_pkgname}.menu" -t "${pkgdir}/usr/share/menu"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.xpm" -t "${pkgdir}/usr/share/pixmaps"
}