# Contributor: raininja <dandenkijin ad gmail dot com>
# Contributor: eagleeyetom <eagleeyetom at gmail dot com>
# Contributor: dalto <dalto at fastmail dot com>
# Maintainer: ahmedmoselhi
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=slimjet
pkgver=39.0.1.0
pkgrel=1
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases"
_libffmpegver=0.73.0
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="https://www.slimjet.com"
_downurl="https://www.slimjetbrowser.com"
license=('custom:freeware')
depends=('libxcb' 'at-spi2-core' 'libxdamage' 'libxcomposite' 'pango' 'gcc-libs' 'libxkbcommon' 'libxrandr' 'alsa-lib' 'sh' 'libxext'\
        'libcups' 'glib2' 'dbus' 'nspr' 'nss' 'libdrm' 'hicolor-icon-theme' 'libxfixes' 'expat' 'glibc' 'libx11' 'mesa' 'cairo')
optdepends=('kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
conflicts=("${pkgname}35")
install="${pkgname}.install"
options=('!emptydirs' '!strip')
source=("${pkgname}-${pkgver}_amd64.deb::${_downurl}/release/${pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
    "LICENSE::${url}/en/webhelp/index.htm"
    "${pkgname}.install")
sha256sums=('f6d6d0a5adc77d5795d991b6a8bb346cc7dd6c24fc652feaad327645b6ddbc84'
            '8cad02e111745402d411414d8f8d15f1504bbcd884ccf050dfad252a63ad633a'
            '2c9dac1462b349e7c077ea33cdc91ff46563b2ca0457617958772a689b4c8d43'
            '2bfc097100279ec967fe51bd413140dfd10e095ac8005729455f9fef884723c8')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    bsdtar -xf "${srcdir}/libffmpeg-${_libffmpegver}.zip" -C "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    install  -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for _icons in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/slimjet/product_logo_${_icons/x*}.png \
            "${pkgdir}"/usr/share/icons/hicolor/${_icons}/apps/flashpeak-slimjet.png
    done
    chmod 0755 "${pkgdir}/opt/${pkgname}/${pkgname}-sandbox"
}
