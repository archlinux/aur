# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easyeditor-bin
_pkgname=Easyeditor
pkgver=1.7.1
pkgrel=1
pkgdesc="An easy markdown editor that allows you to write MarkDown (MD) and preview it in real-time. You can save, load .md files and export to PDF.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/gcclinux/Easyeditor"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
)
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/gcclinux/Easyeditor/v${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums=('32ad25534b23ad354be75f672733ad8bd50022c917c21023d8226bd653eb0dd7')
sha256sums_aarch64=('4bb5165a19f22aa2f03ef08b401b566d9c793e332b5b55dd10b05d1783881b1e')
sha256sums_x86_64=('cb7259f236619977ebd3c864c66431070b3a36e3ec27f10a821e54fcab290035')
prepare() {
    sed -i "s/Name=${pkgname%-bin}/Name=${_pkgname}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
