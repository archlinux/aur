# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ahmyth-bin
_appname=AhMyth
pkgver=1.0_beta.5
pkgrel=2
pkgdesc="Cross-Platform Android Remote Administration Tool"
arch=("i686" "x86_64")
url="https://github.com/Morsmalleo/AhMyth"
license=('GPL3')
depends=('bash' 'electron11' 'hicolor-icon-theme' 'python' 'java-runtime' 'python-requests')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
source=("${pkgname%-bin}.sh")
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${url}/releases/download/v${pkgver//_/-}/${_appname}-Setup_ia32.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver//_/-}/${_appname}-Setup_amd64.deb")
sha256sums=('4b6a46d703e85560a84c89337aec0f0e269e68df2a18b72939b000b765d0e94a')
sha256sums_i686=('35c7bca338c9695a942e140eb859fefeabac855a85453fdd1df7c802c1196f98')
sha256sums_x86_64=('4972835fd3bb2db43f1ae476d157804047d3b75dc25c1678f1c74522be42a1c4')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    cp -r "${srcdir}/opt/${_appname}/resources/app.asar.unpacked" "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}