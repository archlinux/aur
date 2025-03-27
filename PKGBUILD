# Maintainer: Victor RH <blitzkriegfc@gmail.com>
pkgname=steamos-add-to-steam
pkgver=1.0.0
pkgrel=1
pkgdesc="Replicates the Steam Deck 'Add to Steam' functionality for KDE Plasma 6 on Arch Linux. This package adds a context menu item to launchers and Dolphin service menus, allowing users to add any application as a non-Steam game in their Steam library."
arch=('x86_64')
url="https://github.com/vicrodh/steamos-add-to-steam"
license=('MIT')
# Dependencies: kdialog, kmimetypefinder, python, and either native steam or flatpak for Steam.
depends=('kdialog' 'kmimetypefinder' 'python' 'steam' 'flatpak')
# Source: clone from your GitHub repository
source=("git+https://github.com/vicrodh/steamos-add-to-steam.git")
# Skip checksum as this is a VCS source.
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/steamos-add-to-steam"
    # You can add any patching or preparation steps here if needed.
}

build() {
    # No compilation is needed as this package only installs scripts and desktop files.
    :
}

package() {
    cd "$srcdir/steamos-add-to-steam"
    # Install the executable script to /usr/bin
    install -Dm755 "bin/add-to-steam" "$pkgdir/usr/bin/add-to-steam"

    # Install the kicker actions desktop file to /usr/share/plasma/kickeractions
    install -Dm644 "share/kickeractions/steam.desktop" "$pkgdir/usr/share/plasma/kickeractions/steam.desktop"

    # Install the ServiceMenus desktop file to /usr/share/kservices6/ServiceMenus
    install -Dm644 "share/kservices/steam.desktop" "$pkgdir/usr/share/kservices6/ServiceMenus/steam.desktop"

    # Create the directory for kservices5 ServiceMenus and create a symlink to the file in kservices6
    install -d "$pkgdir/usr/share/kservices5/ServiceMenus"
    ln -s "/usr/share/kservices6/ServiceMenus/steam.desktop" "$pkgdir/usr/share/kservices5/ServiceMenus/steam.desktop"
}
