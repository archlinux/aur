# Maintainer: skyline69 <67526259+skyline69@users.noreply.github.com>
pkgname=balatro-mod-manager-bin
_pkgname=balatro-mod-manager
pkgver=0.3.8
pkgrel=1
pkgdesc='A mod manager for Balatro - easily install and manage mods for the popular roguelike deckbuilding game'
arch=('x86_64')
url='https://github.com/skyline69/balatro-mod-manager'
license=('GPL-3.0-or-later')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'hicolor-icon-theme'
)
optdepends=(
    'discord: Discord Rich Presence support'
)
provides=("${_pkgname}" 'bmm')
conflicts=("${_pkgname}" 'bmm')
options=('!strip' '!debug')
source=("${_pkgname}-${pkgver}.deb::https://github.com/skyline69/${_pkgname}/releases/download/v${pkgver}/Balatro.Mod.Manager_${pkgver}_amd64.deb")
sha256sums=('5a43be9b6f3af39c368ea83f68577fd13e32f4178c264536b4093463a90ae2a4')

package() {
    # Extract the data archive from the deb
    bsdtar -xf data.tar.gz -C "${pkgdir}/"

    # Rename desktop file to remove spaces (FreeDesktop spec recommends no spaces)
    mv "${pkgdir}/usr/share/applications/Balatro Mod Manager.desktop" \
       "${pkgdir}/usr/share/applications/balatro-mod-manager.desktop"

    # Create symlink for more standard command name
    ln -s BMM "${pkgdir}/usr/bin/balatro-mod-manager"
}
