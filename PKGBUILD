# Maintainer: mekambe <grubyogon10@gmail.com>
# Contributor: Def
# PKGBUILD for Cultris II

pkgname=cultris2-git
pkgver=1.0.6
pkgrel=1
pkgdesc="Cultris II is one of the fastest Tetris®-clones ever! Train your reflexes in single-player challenges, enjoy split-screen matches with friends, or compete online with the best."
arch=('x86_64')
url="https://github.com/LofisMusk/c2-patch-aur"
license=('proprietary')
depends=('jdk17-temurin')
makedepends=('git')
source=("git+https://github.com/LofisMusk/c2-patch-aur.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/c2-patch-aur"

    # Create necessary directories
    install -d "$pkgdir/opt/cultris2/libs"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/applications"
    install -d "$pkgdir/opt/cultris2/settings"

    # Install files
    install -Dm644 "cultris2.jar" "$pkgdir/opt/cultris2/cultris2.jar"
    cp -r libs/* "$pkgdir/opt/cultris2/libs/"
    cp -r settings/* "$pkgdir/opt/cultris2/settings/"

    # Apply permissions to all files in settings directory
    chmod -R 777 "$pkgdir/opt/cultris2/settings"

    # Install startup scripts with executable permissions
    install -Dm755 "cultris2.sh" "$pkgdir/opt/cultris2/cultris2.sh"
    install -Dm755 "cultris2-settings.sh" "$pkgdir/opt/cultris2/cultris2-settings.sh"
    install -Dm755 "cultris2-colorpicker.sh" "$pkgdir/opt/cultris2/cultris2-colorpicker.sh"

    # Install icon and desktop entries
    install -Dm644 "icon.png" "$pkgdir/opt/cultris2/icon.png"
    install -Dm644 "cultris2.desktop" "$pkgdir/usr/share/applications/cultris2.desktop"
    install -Dm644 "cultris2-settings.desktop" "$pkgdir/usr/share/applications/cultris2-settings.desktop"
    install -Dm644 "cultris2-colorpicker.desktop" "$pkgdir/usr/share/applications/cultris2-colorpicker.desktop"
}
