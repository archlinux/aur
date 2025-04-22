# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xbyyunpan-bin
_zhsname='小白羊云盘'
_pkgname=XBYDriver
pkgver=3.14.1
_electronversion=21
pkgrel=2
pkgdesc="小白羊网盘 - Powered by 阿里云盘Open.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://xbysite.pages.dev/"
_dlurl="https://github.com/zxp19821005/My_AUR_Files"
license=('LicenseRef-custom')
provides=("aliyunpan-liupan1890")
conflicts=(
    "${pkgname%-bin}"
    "aliyunpan-liupan1890"
    "aliyunpan-odomu"
    "xbydriver"
)
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_dlurl}/releases/download/${pkgname%-bin}-${pkgver}/${_pkgname}-${pkgver}-linux-aarch64.pacman")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.pacman::${_dlurl}/releases/download/${pkgname%-bin}-${pkgver}/${_pkgname}-${pkgver}-linux-armv7l.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_dlurl}/releases/download/${pkgname%-bin}-${pkgver}/${_pkgname}-${pkgver}-linux-x64.pacman")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('dc1b632f7ea3f5caae28a41e3cee0e023955877514359761a82c8cf2f9e8c4fb')
sha256sums_armv7h=('18da4b89cef98378973dc0b7c71ffcdcfbae77b275e4d0db4fb3fd8e618e64fb')
sha256sums_x86_64=('7ac82a21e660c75fd083b76062fd306d5fa79014582741f88133b5fa9d172c2c')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/alixby3/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\"\/opt\/${_zhsname}\/${pkgname%-bin}\"/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_zhsname}/resources/"{crx,engine,images} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${_zhsname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}