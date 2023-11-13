# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=swc_ytdownloader
pkgname="${_pkgname//_/-}-bin"
_appname="YT Downloader"
pkgver=0.1.33
pkgrel=1
pkgdesc="Download and convert Videos from YouTube and other sites with thumbnail and metadata support"
arch=("x86_64")
url="https://projects.software-city.org/p/yt-downloader"
_githuburl="https://github.com/Davis-Software/YTDownloader"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'electron26'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/Davis-Software/YTDownloader/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('990b730d987e6d1a70871affcb754c585285bd77ae176e817204d4e2c8f6f9ec'
            '6c05069775fad84e1ae33b25f8dee3ec183ea8bf2270df24485de616237443bd'
            'ce4e6aa2c9d6950c10b51241e664edc15ed22f76b47444f8eb118841948510e7')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|\"/opt/${_appname}/${_pkgname}\" %U|${pkgname%-bin}|g" \
        -e "s|${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}