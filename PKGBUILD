# Maintainer: Jan Leszczyński <leszczu8023@gmail.com>

pkgname=crystallauncher
pkgrel=1
pkgver=1.1.0.1
pkgdesc="Crystal Launcher is a unofficial Minecraft launcher with support for modpacks and custom HD skin and cape system"
arch=('i686' 'x86_64')
url="https://crystal-launcher.net/"
license=('CCPL')
depends=('java-runtime=8' 'java8-openjfx' 'bash' 'zenity')
makedepends=('unzip')
provides=('crystallauncher')

source=("https://crystal-launcher.net/releases/other/CrystalLauncher.jar"
            "crystallauncher"
            "crystallauncher.desktop"
            "crystallauncher.png")

noextract=('jar')
sha256sums=('cb495e726512a039df6f6d297ba7cfd9ce0b1fe368bad5ba20abe7852d65527a'
            '57e4de6813299249bd3e2739999ab69d9bd8202a01d30547049b24063dd0d192'
            '08fd03cd4f89291b2290f96aeec2bd40c267b03afbabd42a3ad5b127c43cc3f2'
            '214f4f12eb772d2ce945723ab7b126b1fb3e78c009f4132d6b0f98ea2270ab0c')

pkgver() {
    echo $pkgver
}

package() {
    cd "$srcdir"

    # create folder for the main jar executable
    mkdir -p "${pkgdir}/usr/share/java/CrystalLauncher/"
    chmod -R 755 "${pkgdir}/usr/share/java/CrystalLauncher/"

    # install shell wrapper script
    install -D -m755 "${srcdir}/crystallauncher"         "${pkgdir}/usr/bin/crystallauncher"

    # install jar
    install -D -m644 "${srcdir}/CrystalLauncher.jar"     "${pkgdir}/usr/share/java/CrystalLauncher/launcher.jar"

    # install desktop launcher with icon
    install -D -m644 "${srcdir}/crystallauncher.desktop" "${pkgdir}/usr/share/applications/crystallauncher.desktop"
    install -D -m644 "${srcdir}/crystallauncher.png"     "${pkgdir}/usr/share/pixmaps/crystallauncher.png"
}
