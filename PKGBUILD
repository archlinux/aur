# Contributor: Braeden Mollot <3mollot at gmail dot com>
# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=min-browser-bin
_appname=Min
pkgver=1.28.1
pkgrel=2
pkgdesc="A fast, minimal browser that protects your privacy"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://minbrowser.org/"
_githuburl="https://github.com/minbrowser/min"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron24')
makedepends=('asar')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-browser-bin}-${pkgver}-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-browser-bin}-${pkgver}-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-browser-bin}-${pkgver}-amd64.deb")
source=("${pkgname%-bin}.sh")
sha256sums=('bcbf1e061d93fa0fb6ac680c669b64332a04500cb32589e6ab1e40846299be26')
sha256sums_aarch64=('b6ca7db98ba8bedb17cb7a4a48afc326e2d42f482befcb14e584341e4852a179')
sha256sums_armv7h=('60856a291dde2cee20b35cdf4714bb6d0fb0ea77078d2b88a6207507af33a37b')
sha256sums_x86_64=('4531e1f4db60878b848c4fa06dcd66da56bb251a39e8ba04f9d42b6803920bbb')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    asar pack "${srcdir}/opt/${_appname}/resources/app" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    sed "s|/opt/${_appname}/${pkgname%-browser-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g;s|Icon=${pkgname%-browser-bin}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-browser-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-browser-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-browser-bin}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}