# Maintainer: Giovanni Santini <giovannisantini93@yahoo.it>
pkgname=crystal-launcher
pkgver=20210809
pkgrel=1
pkgdesc="A custom Minecraft launcher with its own package system"
arch=(any)
url="https://crystal-launcher.net/"
license=('unknown')
depends=(
    # For Minecraft >= 1.17
    "java-runtime=8"
    # For Minecraft <  1.17
    "java-runtime>=16"
    # For client GUI
    java8-openjfx
)
install="$pkgname.install"
source=("$pkgname.jar::http://main.crystal-launcher.pl/releases/other/CrystalLauncher.jar"
        "$pkgname.png::http://main.crystal-launcher.pl/releases/icon.png"
        "$pkgname.sh"
        "$pkgname.desktop")
noextract=()
sha256sums=('cb495e726512a039df6f6d297ba7cfd9ce0b1fe368bad5ba20abe7852d65527a'
            '214f4f12eb772d2ce945723ab7b126b1fb3e78c009f4132d6b0f98ea2270ab0c'
            '6aec5cf9f6ed8a20e138104e0cb9f33c1cbb0798ca00981158b9dbd3c4cc437a'
            'ff160d4a4cfe366f0ec806d7eeeac4bfd5e83c3d01afbc22ecc5caa1adb247ef')

# Adjust this based on the runtimes you will use.
# The defaults are the one available in the official repositories.
_jre_16="jre-openjdk"
_jre_8="jre8-openjdk"

package() {
    cd "$srcdir"

    mkdir -p "$pkgdir/usr/share/java"
    cp -v "$pkgname.jar" "$pkgdir/usr/share/java"

    mkdir -p "$pkgdir/usr/bin"
    # Adjust the JVMs in the script
    sed -i "$pkgname.sh" -e "s|%JAVA_8%|$_jre_8|" -e "s|%JAVA_16%|$_jre_16|"
    cp -v  "$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    mkdir -p "$pkgdir/usr/share/applications"
    cp -v "$pkgname.desktop" "$pkgdir/usr/share/applications"

    mkdir -p "$pkgdir/usr/share/pixmaps"
    cp -v "$pkgname.png" "$pkgdir/usr/share/pixmaps"
}
