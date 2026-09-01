# Maintainer: Rongbo <wurongbo2012@hotmail.com>
pkgname=xmcl-electron-bin
pkgver=0.68.1
pkgrel=1
pkgdesc="X Minecraft Launcher - An Open Source Minecraft Launcher with Modern UX. Provides a Disk Efficient way to manage all your Mods!"
arch=('x86_64' 'aarch64')
url="https://xmcl.app/"
license=('MIT')
depends=('electron')
makedepends=('asar')
checkdepends=()
optdepends=(
    'jre11-openjdk: Recommended for Minecraft 1.12(17w13a)-1.17(21w18a)'
    'jre17-openjdk: Recommended for Minecraft 1.17(21w19a)-1.20'
    'jre21-openjdk: Required for Minecraft 1.21'
    'jre25-openjdk: Required for Minecraft 26'
)
provides=('xmcl')
conflicts=()

_registry="https://registry.npmjs.org"
source=(
    "xmcl.desktop"
)
sha256sums=('2bec20067e7ef4c7265be764a06dc8b94d98fef53cf6c1ddca25f2f6814d7010')
source_x86_64=("app-${pkgver}-x86_64.asar.gz::https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/app-${pkgver}-linux.asar.gz")
source_aarch64=("app-${pkgver}-aarch64.asar.gz::https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/app-${pkgver}-linux-arm64.asar.gz")
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
    install -d ${pkgdir}/usr/lib/xmcl
    asar e ${srcdir}/app-${pkgver}-${CARCH}.asar ${pkgdir}/usr/lib/xmcl/
#   install -Dm 644 ${srcdir}/app-${pkgver}-${CARCH}.asar ${pkgdir}/usr/lib/xmcl/app.asar
    install -Dm 644 ${pkgdir}/usr/lib/xmcl/dark@256x256.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xmcl.png
#   install -Dm 644 ${srcdir}/dark_512x512x32.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/xmcl.png
    install -Dm 644 ${srcdir}/xmcl.desktop ${pkgdir}/usr/share/applications/xmcl.desktop
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/xmcl" <<EOF
#!/usr/bin/bash
exec electron /usr/lib/xmcl/ "\$@"
EOF
}
