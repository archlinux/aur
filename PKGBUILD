# Maintainer: Sahil Gupte <ovenoboyo@gmail.com>

pkgname=moosync
pkgver=1.1.0
pkgrel=2
pkgdesc='A simple music player'
arch=('x86_64')
url='https://github.com/Moosync/Moosync'
license=('GPL3')
provides=("${pkgname}")
depends=('electron17-bin' 'libvips')
source=("${pkgname}-${pkgver}.tar::https://github.com/Moosync/Moosync/releases/download/v${pkgver}/Moosync-${pkgver}-linux-x64.pacman" moosync)
sha256sums=('9d15355f15d5f16277b143fcbbae8098cfc9129755987c7b968251bfb35558be' '4358bc8c2511a4d8c7ca3ca88357a07124be7dff827009317e19f1b3e4fa3ec5')

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