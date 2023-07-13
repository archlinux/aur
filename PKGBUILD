# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="flawesome-bin"
pkgver=0.2.3
pkgrel=7
pkgdesc="A modern productivity tool that will help you organise your day-today work and thoughts."
arch=("x86_64")
url="https://github.com/ashishBharadwaj/flawesome"
license=('GPL3')
depends=('electron9' 'hicolor-icon-theme' 'bash')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}" "${pkgname%-bin}-appimage")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('1cb04d7b3bb6c57b269c4214b46d7619b6480697b7ac73acd209448711ea4252'
            'd654f6b13749f535e115ecf2940be54de9badb37f9f32eaa89f58895c7cea06e')
   
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/Flawesome/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    sed "s|/opt/Flawesome/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Productivity|Utility|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}