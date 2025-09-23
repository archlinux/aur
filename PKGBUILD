# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=easytv-bin
_pkgname=easyTV
_zhsname='极简TV'
pkgver=2.9.9
pkgrel=1
pkgdesc="A lightweight IPTV player, supports all platforms and Android TV big screens. Welcome to download and experience!(Prebuilt version)一款轻量级IPTV播放器"
arch=('x86_64')
url="https://github.com/aiyakuaile/easy_tv_live"
license=('CC-BY-NC-SA-4.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'alsa-lib'
    'libpulse'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-linux-x86_64.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/aiyakuaile/easy_tv_live/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('152c152e6ff1e683c98a711f6035844de21b8f1105fbe8425068f2d8931c911a'
            'ed29e69fccc7077eb337382e4b22599586eadb471e18198e59ad0c8219752be8'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/easy_tv_live/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/Exec=\/usr\/bin\/easy_tv_live/Exec=${pkgname%-bin}/g
        s/Icon=easytv-live/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}-live.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/bin/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/bin/data/flutter_assets/assets/images/app_logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}-live.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
