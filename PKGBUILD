# Maintainer: dalto <dalto[at]fastmail.com>
# Contributor: eagleeyetom <eagleeyetom@gmail.com>
# Original Maintainer: raininja <dandenkijin@gmail.com>
pkgname=slimjet-git
_pkgname=slimjet
pkgver=35.0.3.0
pkgrel=1
pkgver_libffmpeg=0.71.1
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('x86_64')
url="http://www.slimjet.com"
license=('custom:freeware')
depends=('gtk3' 'harfbuzz-icu' 'libxss' 'nss' 'ttf-font')
conflicts=('slimjet')
optdepends=('kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
options=('!emptydirs' '!strip')
_channel=release
source_x86_64=("${_pkgname}-${pkgver}_amd64.deb::http://www.slimjetbrowser.com/release/archive/35.0.3.0/slimjet_amd64.deb")
source=('LICENSE' "libffmpeg.zip::https://github.com/ahmedmoselhi/nwjs-ffmpeg-prebuilt/releases/download/${pkgver_libffmpeg}/${pkgver_libffmpeg}-linux-x64.zip")
md5sums=('e2f3d75bbf4ea8cef106adb30c6b4c83' 
                    'efb7eab92dbda0b4f25343ead437a09a')
md5sums_x86_64=('43c3b5bf9bc57f8346d6e56374ee0e77')

prepare() {
    bsdtar -xf data.tar.xz
    unzip -o libffmpeg.zip
}

package() {
    cp --parents -a {opt,usr/bin,usr/share} "${pkgdir}"

    # install license
    install -dm755 "${pkgdir}/usr/share/licenses/${_pkgname}"
    install  "/${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install  "/${srcdir}/libffmpeg.so" "${pkgdir}/opt/${_pkgname}/libffmpeg.so"

    # install icons
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/${_pkgname}/product_logo_${i/x*}.png \
                       "${pkgdir}"/usr/share/icons/hicolor/${i}/apps/flashpeak-slimjet.png
    done
}