# Maintainer: ahmedmoselhi <ahmedmoselhi55@gmail.com>
# Contributor: dalto <dalto[at]fastmail.com>
# Contributor: eagleeyetom <eagleeyetom@gmail.com>
# Contributor: raininja <dandenkijin@gmail.com>

_pkgname=slimjet
pkgname=slimjet35
pkgbase="${pkgname}"
pkgver=35.0.3.0
pkgrel=1
_pkgver_libffmpeg=0.71.1
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="https://www.slimjet.com/"
license=('custom:freeware')
depends=('gtk3' 'harfbuzz-icu' 'libxss' 'nss' 'ttf-font')
optdepends=('kdialog: needed for file dialogs in KDE'
            'ttf-liberation: fix fonts for some PDFs')
provides=(slimjet)
conflicts=(slimjet)
options=('!emptydirs' '!strip')
_channel=release
source_x86_64=("${_pkgname}-${pkgver}_amd64.deb::http://www.slimjetbrowser.com/release/archive/${pkgver}/slimjet_amd64.deb"
                "nwjs-ffmpeg-ahmedmoselhi-${_pkgver_libffmpeg}-linux-x64.zip::https://github.com/ahmedmoselhi/nwjs-ffmpeg-prebuilt/releases/download/${_pkgver_libffmpeg}/${_pkgver_libffmpeg}-linux-x64.zip")
source=('LICENSE')
sha256sums=('fc0297ac9ec689eeb610024c9f59d5f47661d5e1fdf18bd3c5e456068c47d15e')
sha256sums_x86_64=('58162b86f70bc03d4efd24b055d98b18d1612ff7e7c5ad6bcf4d38ad917116a0'
                   '5b66346c3cb170502b71c9daa79bfdc5e15d7b02589c922bf86e9ecbde6f612f')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"

    # install license
    install  -D "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install  "${srcdir}/libffmpeg.so" "${pkgdir}/opt/${_pkgname}/libffmpeg.so"

    # install icons
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/${_pkgname}/product_logo_${i/x*}.png \
                       "${pkgdir}"/usr/share/icons/hicolor/${i}/apps/flashpeak-slimjet.png
    done
}
