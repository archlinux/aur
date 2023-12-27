# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=syng-bin
_appname=syng
pkgver=2.0.0_beta_5
pkgrel=3
pkgdesc="A free, open source, cross-platform, Chinese-To-English dictionary for desktops."
arch=("x86_64")
url="https://getsyng.com/"
_ghurl="https://github.com/sotch-pr35mac/syng"
license=(
    'GPL3'
    'custom:CC-CEDICT'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'gtk3'
    'openssl'
    'cairo'
    'gdk-pixbuf2'
    'pango'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-2_0.0.5_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/sotch-pr35mac/syng/v${pkgver//_/-}/LICENSE-CC-CEDICT"
)
sha256sums=('18d9c3474e4c486460cc34f07b00259381875f0ac22db6a3cbe24713ba1693ab'
            '997e0e57760a71dfc656727d5bc14149bae55f907990f8c75650673924434f0c')
build() {
    bsdtar -xf "${srcdir}/data.tar.gz"
    sed "s|${pkgname%-bin}-2|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}-2.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}-2" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-2.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 32x32 128x128 256x256@2;do
      install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-2.png" \
        "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}