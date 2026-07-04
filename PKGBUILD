
# Maintainer: Rongbo <wurongbo2012@hotmail.com>
pkgname=xmcl-electron-bin
pkgver=0.60.0
pkgrel=1
pkgdesc="X Minecraft Launcher - An Open Source Minecraft Launcher with Modern UX. Provides a Disk Efficient way to manage all your Mods!"
arch=('x86_64' 'aarch64')
url="https://xmcl.app/"
license=('MIT')
depends=('electron41')
makedepends=('libicns')
checkdepends=()
optdepends=(
    'jre11-openjdk: Recommended for Minecraft 1.12(17w13a)-1.17(21w18a)'
    'jre17-openjdk: Recommended for Minecraft 1.17(21w19a)-1.20'
    'jre21-openjdk: Required for Minecraft 1.21'
    'jre25-openjdk: Required for Minecraft 26'
)
provides=('xmcl')
conflicts=()
source=(
    "https://github.com/Voxelum/x-minecraft-launcher/releases/download/v${pkgver}/app-${pkgver}-linux.asar.gz"
    "https://github.com/Voxelum/x-minecraft-launcher/raw/refs/heads/master/xmcl-electron-app/icons/dark.icns"
    "xmcl.desktop"
)
sha256sums=('92f676ce475b58b434bb8d2f5d44f3e7802a027a1f3f5bf4312e09e9a0f8eef5'
            'cf229073fb478254b751a8198b23be961533101065ca712e323cf60cd15f3383'
            '2bec20067e7ef4c7265be764a06dc8b94d98fef53cf6c1ddca25f2f6814d7010')

prepare() {
    icns2png -x dark.icns
}

package() {
    install -Dm 644 ${srcdir}/app-${pkgver}-linux.asar ${pkgdir}/usr/lib/xmcl/app.asar
    install -Dm 644 ${srcdir}/dark_256x256x32.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/xmcl.png
    install -Dm 644 ${srcdir}/dark_512x512x32.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/xmcl.png
    install -Dm 644 ${srcdir}/xmcl.desktop ${pkgdir}/usr/share/applications/xmcl.desktop
    install -Dm 755 /dev/stdin "${pkgdir}/usr/bin/xmcl" <<EOF
#!/usr/bin/bash
exec electron41 /usr/lib/xmcl/app.asar "\$@"
EOF
}
