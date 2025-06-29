
# Maintainer: Rongbo <wurongbo2012@hotmail.com>
pkgname=xmcl-electron-bin
pkgver=0.51.1
pkgrel=2
pkgdesc="X Minecraft Launcher - An Open Source Minecraft Launcher with Modern UX. Provides a Disk Efficient way to manage all your Mods!"
arch=('x86_64')
url="https://xmcl.app/"
license=('MIT')
depends=('electron34')
makedepends=()
checkdepends=()
optdepends=(
    'jre11-openjdk: Recommended for Minecraft 1.12(17w13a)-1.17(21w18a)'
    'jre17-openjdk: Recommended for Minecraft 1.17(21w19a)-1.20'
    'jre21-openjdk: Recommended for Minecraft 1.21'
    'java-runtime'
)
provides=('xmcl')
conflicts=('xmcl-launcher-bin')
source=("https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/app-${pkgver}-linux.asar.gz"
    "https://github.com/Voxelum/x-minecraft-launcher/blob/v${pkgver}/xmcl-electron-app/icons/dark@256x256.png?raw=true"
    "xmcl.desktop"
)

sha256sums=('SKIP'
    'SKIP'
    '2bec20067e7ef4c7265be764a06dc8b94d98fef53cf6c1ddca25f2f6814d7010'
)

package() {
    #cd ${pkgdir}
    install -Dm 644 ${srcdir}/app-${pkgver}-linux.asar ${pkgdir}/usr/lib/xmcl/xmcl.asar
    install -Dm 644 ${srcdir}/dark@256x256.png?raw=true ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xmcl.png
    install -Dm 644 ${srcdir}/xmcl.desktop ${pkgdir}/usr/share/applications/xmcl.desktop
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/xmcl" <<EOF
#!/usr/bin/bash
exec electron34 /usr/lib/xmcl/xmcl.asar "\$@"
EOF
}
