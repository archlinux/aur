# Maintainer: Rafael Medeiros <rafamedeiros0@gmail.com>
pkgname=perssua-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Your AI companion for LeetCode - because sometimes we all feel stupid"
arch=('x86_64')
url="https://perssua.com/"
license=('LicenseRef-proprietary')
provides=('perssua')
conflicts=('perssua')
depends=('gtk3' 'hicolor-icon-theme' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils')
optdepends=('libappindicator-gtk3: for system tray support')
options=('!strip' '!emptydirs')
source=("https://downloads.perssua.com/Perssua-${pkgver}-amd64.deb")
sha256sums=('4c2d077fc02ab751b7f77680388f6416401c58496e5ffa618178c4ebc56453cc')

package() {
    # Extract data.tar.xz from the .deb archive
    bsdtar -xf data.tar.xz -C "${pkgdir}"

    # Fix permissions
    chmod 755 "${pkgdir}/opt/Perssua/perssua"

    # Create symlink in /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/Perssua/perssua "${pkgdir}/usr/bin/perssua"
}
