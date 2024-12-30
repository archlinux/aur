# Maintainer: mekambe <grubyogon10@gmail.com>
# Contributor: Def
# PKGBUILD for Cultris II

pkgname=cultris2-git
pkgver=1.0.16
pkgrel=1
pkgdesc="Cultris II is one of the fastest Tetris®-clones ever! Train your reflexes in single-player challenges, enjoy split-screen matches with friends, or compete online with the best."
arch=('x86_64')
url="https://github.com/LofisMusk/c2-patch-aur"
license=('proprietary')
depends=('jdk17-temurin')
makedepends=('git')
source=("git+https://github.com/LofisMusk/c2-patch-aur.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/c2-patch-aur"
  git describe --tags | sed 's/^v//;s/-/./g'
}

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
    cp cultris2.policy "$pkgdir/opt/cultris2/"

    # Apply permissions to all files in settings directory
    chmod -R 777 "$pkgdir/opt/cultris2/settings"
    chmod -R 777 "$pkgdir/opt/cultris2"

    # Install startup scripts with executable permissions
    install -Dm777 "scripts/cultris2.sh" "$pkgdir/opt/cultris2/cultris2.sh"
    install -Dm777 "scripts/cultris2-colorpicker.sh" "$pkgdir/opt/cultris2/cultris2-colorpicker.sh"
    install -Dm777 "scripts/cultris2-settings.sh" "$pkgdir/opt/cultris2/cultris2-settings.sh"
    
    # Install icon and desktop entries
    cp -r "desktop-files/icon.png" "$pkgdir/opt/cultris2/icon.png"
    cp -r "desktop-files/cultris2.desktop" "$pkgdir/usr/share/applications/cultris2.desktop"
    cp -r "desktop-files/cultris2-settings.desktop" "$pkgdir/usr/share/applications/cultris2-settings.desktop"
    cp -r "desktop-files/cultris2-colorpicker.desktop" "$pkgdir/usr/share/applications/cultris2-colorpicker.desktop"
}
