# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=iptvnator-electron-bin
_appname=IPTVnator
pkgver=0.14.0
pkgrel=4
pkgdesc="Cross-platform IPTV player application with multiple features, such as support of m3u and m3u8 playlists, favorites, TV guide, TV archive/catchup and more.Use system electron."
arch=('aarch64' 'armv7h' 'x86_64')
url="https://iptvnator.vercel.app/"
_githuburl="https://github.com/4gray/iptvnator"
license=('MIT')
provides=("${pkgname%-electron-bin}=${pkgver}")
conflicts=("${pkgname%-electron-bin}")
depends=('bash' 'electron25' 'hicolor-icon-theme')
source_aarch64=("${pkgname%-electron-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-electron-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-electron-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-electron-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-electron-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-electron-bin}_${pkgver}_amd64.deb")
source=("LICENSE.md::https://raw.githubusercontent.com/4gray/iptvnator/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh")
sha256sums=('475a6c9a7c4fd3157f78c0afa1daab94fb81ff23dd94dad81e0f657ba5259f74'
            'ef8ffc7efe435dfaeafea84674e097706be3de9dd6f307a6432b99511b412f9f')
sha256sums_aarch64=('81dce66634744815d6f72df8b2976969447a8f50b0ca1f2ab79594720939b58b')
sha256sums_armv7h=('c02c3529f5f0a9ad499db9f21711ba7baadb655fd623ba7897e0dfb191c8491a')
sha256sums_x86_64=('c98051f020bb64231ed6356a784084a14ee800c28d2e1af856df50d4f0d46cec')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_appname}/${pkgname%-electron-bin} %U|${pkgname%-bin}|g;s|Video|AudioVideo|g;s|Icon=${pkgname%-electron-bin}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-electron-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    for icons in 16x16 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${icons}/apps/${pkgname%-electron-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/${icons}/apps"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-electron-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}