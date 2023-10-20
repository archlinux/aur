# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=knowledge-canvas-bin
_appname=Knowledge
pkgver=0.8.4
pkgrel=1
pkgdesc="A tool for saving, searching, accessing, and exploring all of your favorite websites, documents and files."
arch=('aarch64' 'x86_64')
url="https://github.com/KnowledgeCanvas/knowledge"
_downurl="https://knowledge-canvas.s3.us-west-2.amazonaws.com"
license=('Apache')
depends=('bash' 'electron26')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_downurl}/${_appname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_downurl}/${_appname}-${pkgver}.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('3f0eb4f7ad6074d31347c633038e8f3fbe17b6c968a0614d019b1b7d77385fb0')
sha256sums_aarch64=('fac7304e9c9c91b2f14533e688c07a864b387f64b6d74d89c12556d01a71e85e')
sha256sums_x86_64=('a798d748546321958472114c96924f17f32a312ae85f66ddcf7313b97c5b6046')
build() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun --no-sandbox %U|${pkgname%-bin}|g;s|Education|Education;Utility|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/"* -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/opt/${pkgname%-bin}/usr/lib"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}