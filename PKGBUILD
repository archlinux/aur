# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=escrcpy-bin
_pkgname=Escrcpy
pkgver=1.9.0
pkgrel=1
pkgdesc="使用图形化的 Scrcpy 显示和控制您的 Android 设备，由 Electron 驱动"
arch=('aarch64' 'x86_64')
url="https://github.com/viarotel-org/escrcpy"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=('bash' 'electron27' 'scrcpy' 'android-sdk-platform-tools')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/viarotel-org/escrcpy/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('e03f21dc67e766661667d3268c1ce5fbce9c32fb4b6e70281722bfbc9e3b7a7e'
            '95b1863c49ed526e664d14fcb4cfe30be5f4f581dc60903a7421a91354ff3a61')
sha256sums_aarch64=('8064fc1ef5b13417a9f71b3173234ec646cd0f5f0b8e9f1e6e6549ae535dd91d')
sha256sums_x86_64=('0e13d5254dc606eb261b69f585aebe0eaad11b06bcbc996cb16927bdc8dd9dac')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/extra/"*.png \
        -t "${pkgdir}/opt/${pkgname%-bin}/resources/extra"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-bin}"
}