# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=x-minecraft-launcher-bin
_appname="X Minecraft Launcher"
pkgver=0.37.3
pkgrel=1
pkgdesc="An Open Source Minecraft Launcher with Modern UX. Provide a Disk Efficient way to manage all your Mods!"
arch=('aarch64' 'x86_64')
url="https://xmcl.app/"
_githuburl="https://github.com/Voxelum/x-minecraft-launcher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron21')
makedepends=('gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.asar::${_githuburl}/releases/download/v${pkgver}/app-${pkgver}-linux-arm64.asar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.asar::${_githuburl}/releases/download/v${pkgver}/app-${pkgver}-linux.asar")
source=("${pkgname%-bin}.png::https://raw.githubusercontent.com/Voxelum/x-minecraft-launcher/v${pkgver}/xmcl-electron-app/icons/dark%40256x256.png"
    "LICENSE::https://raw.githubusercontent.com/Voxelum/x-minecraft-launcher/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('4c56e72cc6784c4c2d870c307d74e7afa6c13b001bb52f9b255cd82ab709adcb'
            '274fb5c556a3f3fdc5b37ef6f6bbd8e35055b11a816f3ae69efec869f85638f5'
            'd5d8ff006e34718c2c3466b31af900e0a7772d526e611b2e827a1059ff990e0e')
sha256sums_aarch64=('518578a89434f4dc6cc172bb30ca31961c36a71526ab8e5cc6869b3edc9341f0')
sha256sums_x86_64=('61b8076566503fd776cf60a80bd6d4c7b2220e089507f43fdb40886102b91411')
build() {
    gendesk -q -f -n --categories "Game" --name "${_appname}" --exec "${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/opt/${pkgname%-bin}/resources/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}