# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="p3x-redis-ui-bin"
pkgver=2023.10.236
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
sha256sums=('11b4505d15f2a29f0fae56d6ec20c8fdb9195d33a210ab8bd1a59ed4652216e9'
            '543c84f92507339466afa0aace275621589f794ca68d6f746e27f6d874e0fbba')
sha256sums_aarch64=('7c94ae04200a2fc3503b8205590776ba79c6a859874965c176063513c4b1782e')
sha256sums_armv7h=('df94e09cd03c4bb0a3d2dbb8d877d705bc29effe5b710173be0f131df1beb51f')
sha256sums_x86_64=('153ffc2e8dc2a1700a1bd5f203be41236efcd701310838b71a0c0c5ed3b2654f')
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