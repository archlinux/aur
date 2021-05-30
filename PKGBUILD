# Maintainer: Ruben Solvang <post@rubensolvang.no>
pkgname=bas21-bin
pkgver=1.5.10
pkgrel=1
pkgdesc="A norwegian accounting and invoice system"
arch=('x86_64')
url=https://bas21.no
license=('custom')
sha256sums=('311dcca8fab71271b8457d3ec1fb80d8c718c3b4b99c605f687b7ec9fd3fa0ed')
options=('!strip')
depends=('openssl>=1.1.1')
source=("https://download.bas21.no/bas21/bas21-$pkgver.tar.xz")

package() {
    cd "${srcdir}"

    # Install BAS21
    install -dm755 "${pkgdir}/opt"
    cp --preserve=mode -r "bas21-${pkgver}" "${pkgdir}/opt/bas21"

    # Install icons
    for res in 128x128 16x16 256x256 32x32 48x48; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${res}/apps"
        ln -s "/opt/bas21/res/cencit-bascore-${res}.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/cencit-bascore.png"
    done

    # Install desktop entry and executable
    install -dm755 "${pkgdir}/usr/share/applications"
    install -Dm644 "bas21-${pkgver}/res/cencit-bas21.desktop" "${pkgdir}/usr/share/applications/bas21.desktop"
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/bas21/bas21" "${pkgdir}/usr/bin/bas21"
}

