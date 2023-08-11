# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fotograph-bin
_appname=Fotograph
pkgver=0.1.0_alpha
pkgrel=4
pkgdesc="A cross platform image manipulation desktop application"
arch=("x86_64")
url="https://fotograph.vercel.app/"
_githuburl="https://github.com/Adedoyin-Emmanuel/FotoGraph"
license=('MIT')
depends=('electron23' 'hicolor-icon-theme' 'bash' 'gcc-libs' 'glibc')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver//_/-}/${_appname}_1.0.0_amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('6c92bb3b3e160abf34bbd8a73e844792a679558ec37ab38a6dad9919e211278f'
            '25ee70cbb067f399b92514d2c3d473e11492a8fc73724bbf7897c6f94a6cbe5c')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|/opt/${_appname}/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${_appname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}