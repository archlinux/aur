# Original Maintainer: raininja <dandenkijin@gmail.com>
# Contributor: eagleeyetom <eagleeyetom@gmail.com>
# Maintainer: dalto <dalto[at]fastmail.com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=slimjet
pkgver=38.0.5.0
pkgrel=1
_libffmpegverurl="https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases"
_libffmpegver=0.73.0
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="https://www.slimjet.com"
_downurl="https://www.slimjetbrowser.com"
license=('custom:freeware')
depends=(libxcb at-spi2-core libxdamage libxcomposite pango gcc-libs libxkbcommon libxrandr alsa-lib bash \
        libcups glib2 dbus nspr nss libdrm hicolor-icon-theme libxfixes expat glibc libx11 mesa cairo libxext)
optdepends=('kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
conflicts=('slimjet35')
options=('!emptydirs' '!strip')
source=(
    "${pkgname}-${pkgver}_amd64.deb::${_downurl}/release/${pkgname}_amd64.deb"
    "libffmpeg-${_libffmpegver}.zip::${_libffmpegverurl}/download/${_libffmpegver}/${_libffmpegver}-linux-x64.zip"
    "LICENSE"    
    )
sha256sums=('6e5f9c1819dd35a89b7eac36b0788a4693a5d76b62f333278a71ac9a5e20cb3b'
            '8cad02e111745402d411414d8f8d15f1504bbcd884ccf050dfad252a63ad633a'
            'fc0297ac9ec689eeb610024c9f59d5f47661d5e1fdf18bd3c5e456068c47d15e')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    bsdtar -xf libffmpeg-${_libffmpegver}.zip -C "${pkgdir}/opt/${pkgname}/"
    find "${pkgdir}" -type d -exec chmod 755 {} \;
    install  -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/slimjet/product_logo_${i/x*}.png \
            "${pkgdir}"/usr/share/icons/hicolor/${i}/apps/flashpeak-slimjet.png
    done
}
