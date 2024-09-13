# Maintainer: mekambe <grubyogon10@gmail.com>
# Contributor: Def
# PKGBUILD for Cultris II

pkgname=cultris2-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Cultris II is one of the fastest Tetris®-clones ever! Train your reflexes in single-player challenges, enjoy split-screen matches with friends, or compete online with the best."
arch=('x86_64')
url="https://github.com/LofisMusk/c2-patch-aur"
license=('proprietary')
depends=('jdk17-temurin')
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/c2-patch-aur"

    # Create necessary directories
    install -d "$pkgdir/opt/cultris2/libs"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/opt/cultris2/settings"

    # Install JAR file
    install -Dm644 "cultris2.jar" "$pkgdir/opt/cultris2/cultris2.jar"

    # Install libraries
    cp -r libs/* "$pkgdir/opt/cultris2/libs/"

    # Install settings
    cp -r settings/* "$pkgdir/opt/cultris2/settings/"

    # Install startup scripts
    install -Dm755 "${pkgname}.sh" "$pkgdir/opt/cultris2/${pkgname}"
    install -Dm755 "${pkgname}-settings.sh" "$pkgdir/opt/cultris2/${pkgname}-settings"
    install -Dm755 "${pkgname}-colorpicker.sh" "$pkgdir/opt/cultris2/${pkgname}-colorpicker"

    # Install icon
    install -Dm644 "icon.png" "$pkgdir/opt/cultris2/icon.png"

    # Install desktop entries
    install -Dm644 "${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${pkgname}-settings.desktop" "$pkgdir/usr/share/applications/${pkgname}-settings.desktop"
    install -Dm644 "${pkgname}-colorpicker.desktop" "$pkgdir/usr/share/applications/${pkgname}-colorpicker.desktop"
}
