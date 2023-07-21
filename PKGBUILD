# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="spearmint-test-bin"
pkgver=0.14.0
pkgrel=1
pkgdesc="Testing, simplified. || An inclusive, accessibility-first GUI for generating clean, semantic Javascript tests in only a few clicks of a button."
arch=('x86_64')
url="https://www.spearmintjs.com/"
_githuburl="https://github.com/open-source-labs/spearmint"
license=('MIT')
conflits=("${pkgname%-bin}")
depends=('bash' 'electron24' 'python' 'glibc' 'glib2' 'nss' 'libxcb' 'nspr' 'gcc-libs')
source=("${pkgname%-test-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-test-bin}_${pkgver}_amd64.deb"
    "LICENSE::https://raw.githubusercontent.com/open-source-labs/spearmint/main/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('b2c06f2d5ee8049c7d4c365ae89b1cdae725286865882b2686678bd66de9ae62'
            '32c14cbaf21ae0dffb9d2403e379c0eaec5691ab122b7c9c365cd50706736029'
            'a9e325ddad4e3a6428eb681fa7492f78a385cd0cd1ca699a2bbee51ed728feb4')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${pkgname%-test-bin}/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    sed "s|/opt/${pkgname%-test-bin}/${pkgname%-test-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-test-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-test-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-test-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
}