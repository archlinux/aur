# Maintainer: Michael Egger <michael.egger@tsn.at>
pkgname=parity-ui-bin
pkgver=0.2.8
pkgrel=1
pkgdesc="Parity UI - The Parity Dapp shell, browser & launcher (Electron app)"
arch=('x86_64')
url="https://github.com/parity-js/shell"
license=('GPLv3')
provides=('parity-ui')
conflicts=('parity-ui')
depends=('parity>=1.10')
source=("https://github.com/parity-js/shell/releases/download/v${pkgver}/parity-ui-${pkgver}.tar.xz"
        "parity-ui.desktop"
        "parity-ui.png")
sha256sums=('9ea5c745dd80bba5a9dd0f1220696126a55a735e7424c4bdc4176d3a1c2dcd9c'
            '6f5ee5cf6fd7596833275fdbc1b4bb8ef9dc2cc29edd9500036d64efa8092242'
            '512e6d56abe23dd9f27bd4d8c9adf8e6554fe8a1f884984ab7391d9c71354ad5')

package() {
    cd "${srcdir}/parity-ui-${pkgver}"

    mkdir -p "${pkgdir}/usr/lib/parity-ui"
    cp -R ./* "${pkgdir}/usr/lib/parity-ui/"

    install -Dm644 ../parity-ui.desktop "${pkgdir}/usr/share/applications/parity-ui.desktop"
    install -Dm644 ../parity-ui.png "${pkgdir}/usr/share/icons/hicolor/0x0/apps/parity-ui.png"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /usr/lib/parity-ui/parity-ui "${pkgdir}/usr/bin/parity-ui"
}
