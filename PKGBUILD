# Maintainer: Daniel Hammernik <daniel.hammernik@progeek.de>
pkgname=kimai
pkgver=1.1.5
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
sha256sums=('3df21004d7da87f85b9221af6cd12cd1721030b03f84491fef7e72cd25f62bbd'
            'f4b4b8f3a3f892bb67ebeea8b3163fb43b444922326a539ea710e569cc2a4581'
            '188cf417849b5a5afb15b4d9fc5ced12c137b070de30851600ffc802b388995a')

package() {
    # Install application to /opt
    install -dm755 "${pkgdir}/opt/kimai"
    cp -r "${srcdir}/kimai/"* "${pkgdir}/opt/kimai/"

    # Install launcher script
    install -Dm755 "${srcdir}/kimai.sh" "${pkgdir}/usr/bin/kimai"

    # Install desktop entry
    install -Dm644 "${srcdir}/kimai.desktop" "${pkgdir}/usr/share/applications/kimai.desktop"

    # Install icon (from source)
    install -Dm644 "${srcdir}/kimai/lib/kimai.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/kimai.png"
}