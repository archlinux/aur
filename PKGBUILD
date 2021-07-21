# Maintainer: dalto <dalto[at]fastmail.com>
# Contributor: eagleeyetom <eagleeyetom@gmail.com>
# Original Maintainer: raininja <dandenkijin@gmail.com>
pkgname=slimjet
pkgver=31.0.1.0
pkgrel=1
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('i686' 'x86_64')
url="http://www.slimjet.com"
license=('custom:freeware')
depends=('gtk3' 'harfbuzz-icu' 'libxss' 'nss' 'ttf-font')
optdepends=('kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
options=('!emptydirs' '!strip')
_channel=release
source_i686=("${pkgname}-${pkgver}_i386.deb::http://www.slimjet.com/${_channel}/${pkgname}_i386.deb")
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::http://www.slimjet.com/${_channel}/${pkgname}_amd64.deb")
source=('LICENSE')
md5sums=('e2f3d75bbf4ea8cef106adb30c6b4c83')
md5sums_i686=('9a9907d5b96fd65f1462ad6b22cb37e4')
md5sums_x86_64=('a94d8c6a1606d6c344fa1322463efffc')

prepare() {
    bsdtar -xf data.tar.xz
}

package() {
    cp --parents -a {opt,usr/bin,usr/share} "${pkgdir}"

    # fix permissions
    chmod -R go-w "${pkgdir}"

    # install license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install  "/${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # install icons
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/slimjet/product_logo_${i/x*}.png \
                       "${pkgdir}"/usr/share/icons/hicolor/${i}/apps/flashpeak-slimjet.png
    done
}
