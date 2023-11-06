# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=x-minecraft-launcher-bin
_appname="X Minecraft Launcher"
pkgver=0.37.7
pkgrel=1
pkgdesc="An Open Source Minecraft Launcher with Modern UX. Provide a Disk Efficient way to manage all your Mods!"
arch=('aarch64' 'x86_64')
url="https://xmcl.app/"
_githuburl="https://github.com/Voxelum/x-minecraft-launcher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'bash'
    'electron21'
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.asar::${_githuburl}/releases/download/v${pkgver}/app-${pkgver}-linux-arm64.asar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.asar::${_githuburl}/releases/download/v${pkgver}/app-${pkgver}-linux.asar")
source=(
    "${pkgname%-bin}.png::https://raw.githubusercontent.com/Voxelum/x-minecraft-launcher/v${pkgver}/xmcl-electron-app/icons/dark%40256x256.png"
    "LICENSE::https://raw.githubusercontent.com/Voxelum/x-minecraft-launcher/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('4c56e72cc6784c4c2d870c307d74e7afa6c13b001bb52f9b255cd82ab709adcb'
            '274fb5c556a3f3fdc5b37ef6f6bbd8e35055b11a816f3ae69efec869f85638f5'
            '96495a933a42f712d714d8af2888588fe564dd9c1f023563160cf158882d8399')
sha256sums_aarch64=('aad54e185e6e069875c8b3e09a687e3966537d5e5f4dbcfa82e3cd28146bebcd')
sha256sums_x86_64=('79c3e317c5538b5683c597a8d175935945a305ed3d0261731c9071e7762568d5')
build() {
    gendesk -q -f -n --categories "Game" --name "${_appname}" --exec "${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}