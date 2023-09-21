# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=butterfly
pkgname="linwood-${_pkgname}-bin"
_appname="dev.linwood.${_pkgname}"
pkgver=2.0.0_beta.7
pkgrel=2
pkgdesc="Powerful, minimalistic, cross-platform, opensource note-taking app"
arch=("x86_64")
url="https://docs.butterfly.linwood.dev/"
_githuburl="https://github.com/LinwoodDev/Butterfly"
license=('Apache' 'AGPL3' 'CC-BY-4.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=('cairo' 'gtk3' 'glibc' 'at-spi2-core' 'libsecret' 'glib2' 'libepoxy' 'gcc-libs' 'pango' 'hicolor-icon-theme' 'harfbuzz' 'jsoncpp' 'gdk-pixbuf2' 'fontconfig')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-linux.deb"
    "LICENSE::https://raw.githubusercontent.com/LinwoodDev/Butterfly/v${pkgver//_/-}/LICENSE")
sha256sums=('3d5112aaa6f7204d8859c7f2a90672543897949d50e2eaea8a69886a20118a2c'
            '8486a10c4393cee1c25392769ddd3b2d6c242d6ec7928e1414efff7dfb2f07ef')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    sed "s|${_pkgname} %f|${pkgname%-bin} %f|g;s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/usr/bin/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/128x128/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/metainfo/${_appname}.appdata.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.appdata.xml"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_appname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}