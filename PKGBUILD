# Maintainer: dalto <dalto[at]fastmail.com>
# Contributor: eagleeyetom <eagleeyetom@gmail.com>
# Original Maintainer: raininja <dandenkijin@gmail.com>
pkgname=slimjet
pkgver=37.0.3.0
pkgrel=1
pkgver_libffmpeg=0.70.1
pkgdesc="Fast, smart and powerful browser based on Blink"
arch=('i686' 'x86_64')
url="http://www.slimjet.com"
license=('custom:freeware')
depends=('gtk3' 'harfbuzz-icu' 'libxss' 'nss' 'ttf-font')
optdepends=('kdialog: needed for file dialogs in KDE' 'ttf-liberation: fix fonts for some PDFs')
options=('!emptydirs' '!strip')
_channel=release
source_i686=("${pkgname}-30.0.0.5_i386.deb::http://www.slimjet.com/${_channel}/${pkgname}_i386.deb")
source_x86_64=("${pkgname}-${pkgver}_amd64.deb::http://www.slimjetbrowser.com/${_channel}/${pkgname}_amd64.deb")
source=('LICENSE' "libffmpeg.zip::https://github.com/ahmedmoselhi/nwjs-ffmpeg-prebuilt/releases/download/${pkgver_libffmpeg}/${pkgver_libffmpeg}-linux-x64.zip")
md5sums=('e2f3d75bbf4ea8cef106adb30c6b4c83' 'bd185c11aa13dc7cd6be7793c07eca2e')
md5sums_i686=('dc3b1d6b986c23dcd8e3aac6a598d6f2')
md5sums_x86_64=('1D50094813DEB2B53CA4CF523B6C825E')

prepare() {
    bsdtar -xf data.tar.xz
    unzip -o libffmpeg.zip
}

package() {
    cp --parents -a {opt,usr/bin,usr/share} "${pkgdir}"

    # install license
    install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install  "/${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install  "/${srcdir}/libffmpeg.so" "${pkgdir}/opt/slimjet/libffmpeg.so"

    # install icons
    for i in 16x16 22x22 24x24 32x32 48x48 64x64 128x128 256x256; do
        install -Dm644 "${pkgdir}"/opt/slimjet/product_logo_${i/x*}.png \
                       "${pkgdir}"/usr/share/icons/hicolor/${i}/apps/flashpeak-slimjet.png
    done
}
