# Contributor: raininja <dandenkijin ad gmail dot com>
# Contributor: eagleeyetom <eagleeyetom at gmail dot com>
# Contributor: dalto <dalto at fastmail dot com>
# Maintainer: ahmedmoselhi
# Co-Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=slimjet
pkgver=39.0.4.0
pkgrel=1
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt"
_libffmpegver=0.76.1
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="https://www.slimjet.com"
_downurl="https://www.slimjetbrowser.com"
license=('freeware')
depends=('libxcb' 'at-spi2-core' 'libxdamage' 'libxcomposite' 'pango' 'gcc-libs' 'libxkbcommon' 'libxrandr' 'alsa-lib' 'sh' 'libxext'\
        'libcups' 'glib2' 'dbus' 'nspr' 'nss' 'libdrm' 'hicolor-icon-theme' 'libxfixes' 'expat' 'glibc' 'libx11' 'mesa' 'cairo')
optdepends=('kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
conflicts=("${pkgname}35")
install="${pkgname}.install"
options=('!emptydirs' '!strip')
source=("${pkgname}-${pkgver}_amd64.deb::${_downurl}/release/${pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/releases/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
    "LICENSE.html::${url}/en/webhelp/index.htm"
    "${pkgname}.install")
sha256sums=('2103ec82dde1f6eb867ed28fcffca468372b12e081ec81410ab93160fadf75ee'
            'ebfa49c6751a83acf61e17336bf33a54fd9dd837d0de6ffee190d9bd5d45da45'
            '2c9dac1462b349e7c077ea33cdc91ff46563b2ca0457617958772a689b4c8d43'
            '2bfc097100279ec967fe51bd413140dfd10e095ac8005729455f9fef884723c8')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${srcdir}/libffmpeg.so" -t "${pkgdir}/opt/${pkgname}"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/${pkgname}/product_logo_${_icons/x*}.png \
            "${pkgdir}"/usr/share/icons/hicolor/${_icons}/apps/flashpeak-${pkgname}.png
    done
    chmod 0755 "${pkgdir}/opt/${pkgname}/${pkgname}-sandbox"
}