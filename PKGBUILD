# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="p3x-redis-ui-bin"
pkgver=2023.10.220
pkgrel=1
pkgdesc="A very functional handy database GUI and works in your pocket on the responsive web or as a desktop app"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://www.corifeus.com/redis-ui"
_githuburl="https://github.com/patrikx3/redis-ui"
license=("MIT")
conflicts=("${pkgname%-bin}")
providers=("${pkgname%-bin}")
depends=('bash' 'hicolor-icon-theme' 'electron25')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/patrikx3/redis-ui/master/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('f06094d415235b33f6e4e979d95b02606202eb9c6af8a91fcab7a6be2801d011'
            '543c84f92507339466afa0aace275621589f794ca68d6f746e27f6d874e0fbba')
sha256sums_aarch64=('c31e7c914ed7564dea91aecfbc9c308eff243f6e5f2cbdde47b39f7784b96c5a')
sha256sums_armv7h=('a745d389edd6b4d7726369006ab86beb239327391c591266ea55b932be94cc95')
sha256sums_x86_64=('b4103313626f3e155920a2a380345184371c9a3025f871c6cd7554dee7bc4110')
package() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/P3X-Redis-UI/resources/app.asar" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}.asar"
    for _icons in 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    sed "s|/opt/P3X-Redis-UI/${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}