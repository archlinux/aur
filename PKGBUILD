# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=stackzy
pkgname="${_pkgname}-bin"
pkgver=1.2.5
pkgrel=2
pkgdesc="A cross-platform desktop application to identify libraries used inside an android application. Made possible by Compose Desktop"
arch=('x86_64')
url="https://github.com/theapache64/stackzy"
license=(custom)
providers=(theapache64)
confilts=("${_pkgname}")
depends=(libxtst libglvnd fontconfig java-runtime libxrender alsa-lib hicolor-icon-theme glibc libxi libxext libx11 zlib)
source=("${_pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}_${pkgver}-1_amd64.deb"
    "LICENSE::${url}/raw/master/LICENSE")
sha256sums=('26c3727c54db393ca6a6debe72e42551c26f4a850167549159824d9e74d5e59f'
            'd723b568739f559ac352884a347641e0499922597ff02606f4b645e49c714655')
package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    sed 's/Icon=\/opt\/stackzy\/lib\/Stackzy.png/Icon=stackzy/g;s/Unknown/Utility;Development;/g' -i "${pkgdir}/opt/${_pkgname}/lib/${_pkgname}-Stackzy.desktop"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/lib/${_pkgname}-Stackzy.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${pkgdir}/opt/${_pkgname}/lib/Stackzy.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.png"
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}