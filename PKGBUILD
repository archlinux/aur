# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xuanxuan-bin
pkgver=7.2.1
pkgrel=1
pkgdesc="A self-hosted enterprise IM solution.一款功能齐全的企业聊天软件"
arch=('x86_64')
url="https://xuanim.com/index.html"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron13'
    'hicolor-icon-theme'
)
source=("${pkgname%-bin}-${pkgver}.deb::https://dl.cnezsoft.com/${pkgname%-bin}/${pkgver}/${pkgname%-bin}.${pkgver}.linux.amd64.deb"
    "${pkgname%-bin}.sh")
sha256sums=('3bfd97771f1f9e4b1573f1e2890cc06522f80a4bb9e1ca7a80041f6732f8a0d4'
            'a2563fb9fb2f16387e2796882047d254f3c3f7df6ed569fa726e927db5dabad4')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${pkgname%-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-bin}/resources/"{bin,build-in,lang} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/swiftshader/"*.so -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}