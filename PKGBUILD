# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=syng-bin
_pkgname=Syng
pkgver=2.0.0_beta_6
_zhsname='词应'
pkgrel=2
pkgdesc="A free, open source, cross-platform, Chinese-To-English dictionary for desktops.(Prebuilt version)"
arch=("x86_64")
url="https://getsyng.com/"
_ghurl="https://github.com/sotch-pr35mac/syng"
license=(
    'GPL-3.0-only'
    'LicenseRef-CC-CEDICT'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}-2_0.0.6_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/sotch-pr35mac/syng/v${pkgver//_/-}/LICENSE-CC-CEDICT"
)
sha256sums=('dc3d1c2f8a63c97bbf55b122e10002a178194153cc2ba33c78ac6caf3ee949fc'
            '997e0e57760a71dfc656727d5bc14149bae55f907990f8c75650673924434f0c')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/${pkgname%-bin}-2/${pkgname%-bin}/g
        3i\Name[zh_CN]=${_zhsname}
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-2.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}-2" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-2.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}-2.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}