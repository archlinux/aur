# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=knowledge-canvas-bin
pkgver=0.8.3
pkgrel=1
pkgdesc="A tool for saving, searching, accessing, and exploring all of your favorite websites, documents and files."
arch=('aarch64' 'x86_64')
url="https://github.com/KnowledgeCanvas/knowledge"
_downurl="https://knowledge-canvas.s3.us-west-2.amazonaws.com"
license=('Apache')
depends=('bash' 'electron')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.AppImage::${_downurl}/Knowledge-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.AppImage::${_downurl}/Knowledge-${pkgver}.AppImage")
source=("${pkgname%-bin}.sh")
sha256sums=('9ec0a3c757998f07b7572547f8c0d5f50a71ca4e49cb93e6e3199fae5e87310f')
sha256sums_aarch64=('91b2cd84579462e1282dbef3feda64c374586bad55a813f0c2c68526c5f84f2d')
sha256sums_x86_64=('41e82632c4149baca9d4bea39936ba12d0e89e6e71a77f65a37eb229e9ea8427')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|AppRun --no-sandbox %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Education|Education;Utility|g" -i "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}