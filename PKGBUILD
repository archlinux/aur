# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=spark
pkgname="${_appname}-wallet-bin"
_pkgname=Spark
pkgver=0.3.1
pkgrel=1
pkgdesc="A minimalistic wallet GUI for c-lightning, accessible over the web or through mobile and desktop apps."
arch=('x86_64')
url="https://github.com/shesek/spark-wallet"
license=('MIT')
depends=(
    'bash'
    'electron13'
)
conflicts=("${pkgname%-bin}")
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-linux-amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/shesek/spark-wallet/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('074554cbccbf2af7d804272bdb1dee0e266ce8ef5157973996876ff49022fe32'
            'd8a82e79466ba5d679ba7edf5acd05bf6767edeb56f51a76ce8e121c7c887bf2'
            '3412cda660ea2783505bbe089ab3ac70e50d279aa22130d1b88a3372e3b22843')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_appname}-desktop %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${_appname}-desktop.desktop"
}
  
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm6444 "${srcdir}/usr/share/applications/${_appname}-desktop.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}-desktop.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}