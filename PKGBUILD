# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ffbox-bin
_pkgname=FFBox
pkgver=4.0
_electronversion=24
pkgrel=2
pkgdesc="An user-friendly ffmpeg GUI.一个多媒体转码百宝箱/一个 FFmpeg 的套壳"
arch=('x86_64')
url="https://github.com/ttqftech/FFBox"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    #"electron${_electronversion}-bin"
    'ffmpeg'
    'gtk3'
    'nspr'
    'nss'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Linux_${CARCH//_/-}_${_pkgname}_${pkgver}.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/ttqftech/FFBox/v${pkgver}/LICENSE"
    #"${pkgname%-bin}.sh"
)
sha256sums=('eb1a0d0afbde1288ca9ffa5876a18a40c6027e9587a6c943f8fa702b4e18afcc'
            '67ed2b6388724e58664564bf21e73eb1e00dbfe513c70fff71f20517e38dfbca')
build() {
    #sed -e "s|@electronversion@|${_electronversion}|" \
    #    -e "s|@appname@|${pkgname%-bin}|g" \
    #    -e "s|@runname@|app|g" \
    #    -e "s|@options@||g" \
    #    -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    #sed "s|/opt/${_pkgname}/${pkgname%-bin}|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    #sed "s|\"..\/FFBoxService\"),Y|\"..\/..\/${pkgname%-bin}\/FFBoxService\"),Y|g" -i "${srcdir}/opt/${_pkgname}/resources/app/app/main/index.cjs"
}
package() {
    #install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    #install -Dm755 "${srcdir}/opt/${_pkgname}/FFBoxService" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    #cp -r  "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    #install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    #cp -r "${srcdir}/opt/${_pkgname}/" "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    #ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}