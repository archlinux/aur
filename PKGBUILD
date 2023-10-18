# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=panfu-desktop-bin
_pkgname="Panfu Desktop"
pkgver=1.4.2
pkgrel=1
pkgdesc="The desktop application for Panfu with integrated Flash Player"
arch=("i686" "x86_64")
url="https://www.panfu.us/download"
_githuburl="https://github.com/teampanfu/panfu-desktop"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron11' 'hicolor-icon-theme')
source_i686=("${pkgname%-bin}-${pkgver}-i686.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_i386.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/teampanfu/panfu-desktop/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('a8770b3f8133c0d98066fe1e96540b4dbe176f5d21b966f0373236280d1d1761'
            '9aeb65b856c0f1f458505cdda900aa8befab8d8c48ff1be135b2f2af75eb527f')
sha256sums_i686=('4f216778e7ac7d858bef9b57f49e5e92a3c8161456df69b790c1d4aec7aeb0c6')
sha256sums_x86_64=('2bb4dba841f6aed6c19ab9e8b0fe91695b078f08b3ffaa1443affbd5f7bc41d6')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app-update.yml" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/plugins/libpepflashplayer.so" -t "${pkgdir}/opt/${pkgname%-bin}/resources/plugins"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/opt/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}