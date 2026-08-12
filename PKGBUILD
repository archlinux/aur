# Maintainer: Rafael Medeiros <rafamedeiros0@gmail.com>
pkgname=perssua-bin
pkgver=0.25.0
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
install="${pkgname}.install"
source=("https://downloads.perssua.com/Perssua-${pkgver}-amd64.deb"
        "hyprland-perssua.conf")
sha256sums=('cafc41eb2796f9cc917b4ec19de07973fac3c44be3bae9bb5ddbec5de0b6e782'
            'SKIP')

package() {
    # Extract data.tar.xz from the .deb archive
    bsdtar -xf data.tar.xz -C "${pkgdir}"

    # Fix permissions
    chmod 755 "${pkgdir}/opt/Perssua/perssua"

    # Create symlink in /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/Perssua/perssua "${pkgdir}/usr/bin/perssua"

    # Optional Hyprland snippet to disable backdrop blur on Perssua's overlay
    install -Dm644 "${srcdir}/hyprland-perssua.conf" \
        "${pkgdir}/usr/share/perssua/hyprland-perssua.conf"
}
