# Maintainer: Michael Egger <michael.egger@tsn.at>
pkgname=parity-ui-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="Parity UI - The Parity Dapp shell, browser & launcher (Electron app)"
arch=('x86_64')
url="https://github.com/parity-js/shell"
license=('GPLv3')
depends=('parity>=1.10')
source=("https://github.com/parity-js/shell/releases/download/v${pkgver}/parity-ui-${pkgver}.tar.xz"
        "parity-ui.desktop"
        "parity-ui.png")
sha256sums=('506ba24d933e763cd621356e48675676c38caa17371b0943fde16611fdcbd501'
            '2a6e44f8ec0b0c620413cb2e2dbe4128d337a88d41c740447b347c88490c85a4'
            '512e6d56abe23dd9f27bd4d8c9adf8e6554fe8a1f884984ab7391d9c71354ad5')

package() {
    cd "${srcdir}/parity-ui-${pkgver}"

    mkdir -p "${pkgdir}/usr/lib/parity-ui"
    cp -R ./* "${pkgdir}/usr/lib/parity-ui/"

    install -Dm644 ../parity-ui.desktop "${pkgdir}/usr/share/applications/parity-ui.desktop"
    install -Dm644 ../parity-ui.png "${pkgdir}/usr/share/icons/hicolor/0x0/apps/parity-ui.png"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "${pkgdir}/usr/lib/parity-ui/parity-ui" "${pkgdir}/usr/bin/parity-ui"
}
