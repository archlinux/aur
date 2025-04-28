
# Maintainer: Rongbo <wurongbo2012@hotmail.com>
pkgname=xmcl-electron-bin
pkgver=0.50.4
pkgrel=1
pkgdesc="X Minecraft Launcher - A modern Minecraft launcher"
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
    'jre-openjdk'
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

prepare() {
    cd ${srcdir}
    gunzip -f app-${pkgver}-linux.asar.gz
}

package() {
    cd ${pkgdir}
    install -Dm 644 ${srcdir}/app-${pkgver}-linux.asar ${pkgdir}/usr/lib/xmcl/xmcl.asar
    install -Dm 644 ${srcdir}/dark@256x256.png?raw=true ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xmcl.png
    install -Dm 644 ${srcdir}/xmcl.desktop ${pkgdir}/usr/share/applications/xmcl.desktop
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/xmcl" <<EOF
#!/usr/bin/bash
exec electron34 ${pkgdir}/usr/lib/xmcl/xmcl.asar "\$@"
EOF
}
