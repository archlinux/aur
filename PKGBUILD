# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easyeditor-bin
_pkgname=Easyeditor
pkgver=1.7.2
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
sha256sums_aarch64=('380fd364dc1641ae21a31584fce38cd544d463c8a5a29b1a5ab18b77f846ec44')
sha256sums_x86_64=('62a3a0b65a19bc6c7bf29417277e3b2c2ba1d332bfc56a492de7260e5946c6ea')
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
