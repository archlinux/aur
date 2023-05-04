# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=slimjet
pkgname="${_pkgname}-beta-bin"
pkgver=39.0.0.0
pkgrel=2
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt"
_libffmpegver=0.75.1
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="https://www.slimjet.com"
_downurl="https://www.slimjetbrowser.com"
license=('custom:freeware')
depends=('libxcb' 'at-spi2-core' 'libxdamage' 'libxcomposite' 'pango' 'gcc-libs' 'libxkbcommon' 'libxrandr' 'alsa-lib' 'sh' 'libxext'\
        'libcups' 'glib2' 'dbus' 'nspr' 'nss' 'libdrm' 'hicolor-icon-theme' 'libxfixes' 'expat' 'glibc' 'libx11' 'mesa' 'cairo')
optdepends=('kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
conflicts=("${_pkgname}35" "${_pkgname}")
install=
options=('!emptydirs' '!strip')
source=("${pkgname%-bin}-${pkgver}_amd64.deb::${_downurl}/beta/${_pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/releases/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
    "LICENSE.html::${url}/en/webhelp/index.htm")
sha256sums=('86b015dca3e91a71649544501722f26db83982ac311754f32b3e752c0d398961'
            'ce4b76a01f2a323530e4a80e96df85043231f6fec3181231bab89a8501f11790'
            '2c9dac1462b349e7c077ea33cdc91ff46563b2ca0457617958772a689b4c8d43')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/libffmpeg.so" -t "${pkgdir}/opt/${_pkgname}/"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}/opt/${_pkgname}/product_logo_${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/flashpeak-slimjet.png"
    done
    chmod 0755 "${pkgdir}/opt/${_pkgname}/${_pkgname}-sandbox"
}