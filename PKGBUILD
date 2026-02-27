# Maintainer: purpleneutral <purpleneutral@users.noreply.github.com>
pkgname=chatalot
pkgver=0.22.6
pkgrel=1
pkgdesc='Self-hosted end-to-end encrypted chat platform — desktop client'
arch=('x86_64')
url='https://github.com/purpleneutral/chatalot'
license=('GPL-3.0-only')
depends=(
    'gtk3'
    'libsoup3'
    'openssl'
    'webkit2gtk-4.1'
)
optdepends=(
    'libsecret: OS keychain storage for identity keys'
    'libappindicator-gtk3: system tray support'
)
conflicts=('chatalot-bin' 'chatalot-git')
options=('!strip' '!debug')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Chatalot_${pkgver}_amd64.deb")
sha256sums=('f43d215bb4446cd7812cc0496843390807ca70f9ad476ed387d2ab936e4966d1')

package() {
    bsdtar -xf data.tar.gz -C "${pkgdir}"

    # Fix empty Categories in .desktop file
    sed -i 's/^Categories=$/Categories=Network;InstantMessaging;Chat;/' \
        "${pkgdir}/usr/share/applications/Chatalot.desktop"

    # Add convenience symlink: chatalot -> chatalot-desktop
    ln -s chatalot-desktop "${pkgdir}/usr/bin/chatalot"
}
