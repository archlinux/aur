# Maintainer: Yurii Kolesnykov <root@yurikoles.com>
# Previous maintainer: Christophe Robin <crobin@nekoo.com>

pkgname=minecraft
pkgver=latest
pkgrel=30
pkgdesc="An open-world game whose gameplay revolves around breaking and placing blocks"
arch=(any)
license=('custom')
url="https://www.minecraft.net/"
depends=('java-runtime>=8' 'xorg-xrandr' 'ttf-font' 'libxtst')
noextract=('minecraft.jar')
source=(https://launcher.mojang.com/download/Minecraft.deb
        minecraft.install)
sha256sums=('cd0ae1dc28f029e6bf2c61cb4a36bb244d4129519917d7a17a7f4c8ad98adb37'
            '5174152203f11821b88993c77e30f2a56bbfe655f7514114a0f1d0f1a40b0d10')
install='minecraft.install'

prepare() {
    tar xpf data.tar.xz
}

package() {
    install -d "${pkgdir}"/opt/minecraft-launcher
    cp -a "${srcdir}/opt/minecraft-launcher/"* "${pkgdir}/opt/minecraft-launcher/"

    install -Dm644 "${srcdir}/usr/share/applications/minecraft-launcher.desktop" \
        "${pkgdir}/usr/share/applications/minecraft-launcher.desktop"

    install -Dm644 "${srcdir}/usr/share/icons/hicolor/symbolic/apps/minecraft-launcher.svg" \
        "${pkgdir}/usr/share/icons/hicolor/symbolic/apps/minecraft-launcher.svg"

    install -d "${pkgdir}/usr/bin"
    ln -s /opt/minecraft-launcher/minecraft-launcher "${pkgdir}/usr/bin/"
}
