# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=chengla
pkgname="${_pkgname}-linux-unofficial-bin"
pkgver=1.0.8
pkgrel=1
pkgdesc="橙啦平台的非官方 Linux 客户端"
arch=("x86_64")
url="https://github.com/pokon548/chengla-for-linux"
license=("GPL3")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron27')
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('a52a2119aeb19c468e29315bb01546e4c306c7aca8a580de1f1924c12f10bdd5'
            '55155410fc74dc8f09ce8ef16184a53e4eec6380ee7e36e5d52666f97a750f5c')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/icon.png" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}