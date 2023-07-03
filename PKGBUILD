# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname="butterfly"
pkgname="linwood-${_pkgname}-bin"
_appname="dev.linwood.${_pkgname}"
_ver=beta.2
pkgver="2.0.0${_ver}"
pkgrel=1
pkgdesc="Powerful, minimalistic, cross-platform, opensource note-taking app"
arch=("x86_64")
url="https://docs.butterfly.linwood.dev/"
_githuburl="https://github.com/LinwoodDev/Butterfly"
license=('Apache' 'AGPL3' 'CC-BY-4.0')
conflits=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
depends=('cairo' 'gtk3' 'glibc' 'at-spi2-core' 'libsecret' 'glib2' 'libepoxy' 'gcc-libs' 'pango' 'hicolor-icon-theme' 'harfbuzz' 'jsoncpp' 'gdk-pixbuf2')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver%${_ver}}-${_ver}/${pkgname%-bin}-linux.deb"
    "LICENSE::https://raw.githubusercontent.com/LinwoodDev/Butterfly/develop/LICENSE")
sha256sums=('6d67584d81c9f01fd688e3aafb908870e1fe2f2923fa3ddea9c2adead54dd257'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
package() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 -d "${pkgdir}/opt"
    cp -r "${srcdir}/usr/bin" "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|Exec=${_pkgname}|Exec=/opt/${pkgname%-bin}/${_pkgname}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
}