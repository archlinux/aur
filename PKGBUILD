# Maintainer: Sahil Gupte <ovenoboyo@gmail.com>

pkgname=moosync
pkgver=0.0.9
pkgrel=4
pkgdesc='A simple music player'
arch=('x86_64')
url='https://github.com/Moosync/Moosync'
license=('GPL3')
provides=("${pkgname}")
depends=('electron')
source=("${pkgname}-${pkgver}.tar::https://github.com/Moosync/Moosync/releases/download/v0.0.9/Moosync-0.0.9-linux-x64.pacman" moosync)
sha256sums=('82d34a9165085e35f480ea453156c5d1bf41c07de60c9774e8c144c52590abcb' '36867efee6f9a491e64979ed329ce87f2136da2afcce4c9ef5696a9f2538d9ba')

package() {
    cd "$srcdir"

    # Place files
    install -d "${pkgdir}/opt/Moosync"
    cp -R "${srcdir}/opt/Moosync/resources" "${pkgdir}/opt/Moosync/resources"

    install -d "${pkgdir}/usr/bin"
    install "moosync" "${pkgdir}/usr/bin/moosync"

    # Edit desktop entry executable path
    sed -i "s/opt\/Moosync\/moosync/usr\/bin\/moosync/g" "${srcdir}/usr/share/applications/moosync.desktop"

    # Place desktop entry and icons
    desktop-file-install -m 644 --dir "${pkgdir}/usr/share/applications/" "${srcdir}/usr/share/applications/moosync.desktop"
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/"
    cp -R "${srcdir}/usr/share/icons/hicolor/"* "${pkgdir}/usr/share/icons/hicolor/"
}
