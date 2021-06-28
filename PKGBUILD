# Maintainer: Stefan Eekhof <stefaneekhof@gmail.com>
pkgname=mtk
pkgver=1.0.0.A2

_cyanversion=1.0.0.A14 # Needed to find the right version ZIP

pkgrel=1
pkgdesc="MTK CLI - Command Line Interface for the Cyan Minecraft Toolkit
(NOT AN OFFICIAL MINECRAFT PRODUCT. NOT APPROVED BY OR ASSOCIATED WITH MOJANG)"
arch=( 'any' )
url=""
license=('LGPL')
groups=()
depends=( 'java-environment' )
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://aerialworks.ddns.net/maven/org/asf/cyan/CyanLoader-Sources/$_cyanversion/CyanLoader-Sources-$_cyanversion-full.zip")
noextract=()
md5sums=('db275ac7a438639381304da44fffd24f')

build() {
    cd MtkCLI
    chmod +x ../gradlew
    ../gradlew -c ../settings.lite.gradle installation
}

package() {
    mkdir "$pkgdir/usr/lib/mtk-libs/" -p
    cd build/MTK-CLI/Installations
    
    rm *-portable
    rm *.bat
    
    mkdir -p "$pkgdir/usr/bin"
    mv mtk "$pkgdir/usr/bin"
    mv rift "$pkgdir/usr/bin"
    mv pseudocode "$pkgdir/usr/bin"
    cp -rf . "$pkgdir/usr/lib/mtk-libs"
}
