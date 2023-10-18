# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=x-minecraft-launcher-bin
_appname="X Minecraft Launcher"
pkgver=0.37.1
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
            '02832427680007bec0ad2ea6df5a264e538e88deb9d2c5315e9ed1f374b9101b')
sha256sums_aarch64=('43b423b0ce2d16100c81eeb82a7f7ce27dabc996c6aad583c6224173edaea42c')
sha256sums_x86_64=('6c38f5b932f43fad03a08019cb96cf0548fd8645cccdac6f357c915ff8c9f837')
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