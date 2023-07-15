# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yarle-evernote-to-md-bin
pkgver=5.2.1
pkgrel=1
pkgdesc="Yarle - The ultimate converter of Evernote notes to Markdown"
arch=(x86_64)
url="https://github.com/akosbalasko/yarle"
license=('MIT')
depends=('bash' 'electron22' 'hicolor-icon-theme')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/akosbalasko/yarle/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('e5a19162be78088b8094b804e7e2d7b5e4ffd27adce9feda4803e3fa96b9d065'
            '16691c563f896a0d485a742fbd5a389fc7c798ff606c75cb3f753bb7297a9bdb'
            'abfe6eb1eb8210af19a98509a662bc1a525e67f0275c51cb6b5d36226cf2b336')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    sed "s| %U||g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 64x64 192x192 512x512;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
        -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}