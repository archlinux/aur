# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easyeditor-bin
_pkgname=Easyeditor
pkgver=1.6.1
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
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/gcclinux/Easyeditor/${pkgver}/LICENSE")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${url}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-1.x86_64.rpm")
sha256sums=('2b94523fd0d3fd7553fcdd10250f68ed5c058749d5d60c8aae906f6f42ace489')
sha256sums_aarch64=('4bfa91fff808fac008cd608f1d6ae45e3eeb54e7f0e807b98c7b48d531adacdf')
sha256sums_x86_64=('72179a7d15af23b0930a15ecc657aefecbe1ec52609aa5fc8343ab602bf2c33c')
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
