# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=saber-bin
_appname="com.adilhanney.${pkgname%-bin}"
_pkgname=Saber
pkgver=0.17.0
pkgrel=1
pkgdesc="A (work-in-progress) cross-platform libre handwritten notes app"
arch=('aarch64' 'x86_64')
url="https://github.com/adil192/saber"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('glibc' 'gcc-libs' 'at-spi2-core' 'pango' 'glib2' 'gtk3' 'libepoxy' 'libsecret' 'gdk-pixbuf2' 'harfbuzz' 'fontconfig' 'cairo')
options=('!strip')
noextract=("${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_arm64.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_v${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('bbe93371ec624d6cc72154e9ee3e2ae52788e4f5e3ded6028f80c8d94a53c7a4')
sha256sums_x86_64=('847c9ff5fc146d5e35d52b4079e3ed75023722cf09afc382f11cf4675b135d29')
build() {
    mkdir -p "${srcdir}/opt/${pkgname%-bin}"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.tar.gz" -C "${srcdir}/opt/${pkgname%-bin}"
    rm -rf "${srcdir}/opt/${pkgname%-bin}/usr"
    sed "s|${_appname}|${pkgname%-bin}|g" -i "${srcdir}/opt/${pkgname%-bin}/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/bin,opt}
    cp -r "${srcdir}/opt/${pkgname%-bin}" "${pkgdir}/opt"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/icons/hicolor/512x512/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/share/metainfo/${_appname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}