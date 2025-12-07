# Maintainer: Daniel Hammernik <daniel.hammernik@progeek.de>
pkgname=kimai
pkgver=1.1.1
pkgrel=1
pkgdesc="Desktop client for Kimai Time Tracking Server"
arch=('x86_64')
url="https://github.com/progeek-de/kimai-client"
license=('AGPL-3.0-or-later')
depends=('hicolor-icon-theme')
optdepends=('libnotify: desktop notifications')
conflicts=('kimai-git')
options=('!strip')

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/progeek-de/kimai-client/releases/download/v${pkgver}/kimai-${pkgver}-linux-portable.tar.gz"
        "kimai.desktop"
        "kimai.sh")
sha256sums=('1547c0629ca836041811c9f2418e900dbc0ff1679fd0a4d89ecec13e2c9199a1'
            'cd16b8c4a81e0eca333a4cf1b725bc5b8893caeca93331cd0955e41733201027'
            '188cf417849b5a5afb15b4d9fc5ced12c137b070de30851600ffc802b388995a')

package() {
    # Install application to /opt
    install -dm755 "${pkgdir}/opt/kimai"
    cp -r "${srcdir}/kimai/"* "${pkgdir}/opt/kimai/"

    # Install launcher script
    install -Dm755 "${srcdir}/kimai.sh" "${pkgdir}/usr/bin/kimai"

    # Install desktop entry
    install -Dm644 "${srcdir}/kimai.desktop" "${pkgdir}/usr/share/applications/kimai.desktop"

    # Install icon
    install -Dm644 "${pkgdir}/opt/kimai/lib/kimai_logo.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kimai.png" 2>/dev/null || true
}