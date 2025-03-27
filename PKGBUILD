# Maintainer: Victor RH <blitzkriegfc@gmail.com>
pkgname=steamos-add-to-steam
pkgver=1.0.0
pkgrel=1
pkgdesc="Replicates the Steam Deck 'Add to Steam' functionality for KDE Plasma 6 on Arch Linux.
This package adds a context menu item to launchers and Dolphin service menus,
allowing users to add any application as a non-Steam game in their Steam library."
arch=('x86_64')
url="https://github.com/vicrodh/steamos-add-to-steam"
license=('MIT')
# No mandatory dependencies as kmimetypefinder, python, and kdialog are part of the base system,
# and Steam / Flatpak are detected at runtime.
depends=()
optdepends=('steam: Native Steam installation is recommended' 'flatpak: For Steam installed via Flatpak')
# The source is fetched from your GitHub repository.
source=("git+https://github.com/vicrodh/steamos-add-to-steam.git")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/steamos-add-to-steam"
    # No patches are needed, but this step can be used for future modifications.
}

build() {
    # This package only installs scripts and desktop files; no build is required.
    :
}

package() {
    cd "$srcdir/steamos-add-to-steam"

    # Install the add-to-steam executable script to /usr/bin.
    install -Dm755 "bin/add-to-steam" "$pkgdir/usr/bin/add-to-steam"

    # Install the kicker actions desktop file to /usr/share/plasma/kickeractions.
    install -Dm644 "share/kickeractions/steam.desktop" "$pkgdir/usr/share/plasma/kickeractions/steam.desktop"

    # Install the ServiceMenus desktop file to /usr/share/kservices6/ServiceMenus.
    install -Dm644 "share/kservices/steam.desktop" "$pkgdir/usr/share/kservices6/ServiceMenus/steam.desktop"

    # Create the directory for kservices5 ServiceMenus and create a symlink to the kservices6 file.
    install -d "$pkgdir/usr/share/kservices5/ServiceMenus"
    ln -s "/usr/share/kservices6/ServiceMenus/steam.desktop" "$pkgdir/usr/share/kservices5/ServiceMenus/steam.desktop"
}
