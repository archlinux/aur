# Maintainer: m4dz <code(at)m4dz(dot)net>

pkgname=keeweb-bin
pkgver=1.0.4
pkgrel=1
pkgdesc="Chrome-based KeePass app - Precompiled binary from official repository"
arch=('x86_64')
url="https://keeweb.info"
license=('MIT')
provides=('keeweb')
install=${pkgname}.install

sha256sums=('b0801dd708e3d4e6afe666e2bf0bdb5dde5af88ec45b18ad132cc97dd81f2cea'
            '5053255afd20f012a105c35890f7ff765e60781eeea95f07dca79c180b6ad341')
source=("https://github.com/antelle/keeweb/releases/download/v${pkgver}/KeeWeb.linux.x64.zip"
        'keeweb.desktop')
noextract=('KeeWeb.linux.x64.zip')

prepare() {
    install -dm755 keeweb
    bsdtar -xf KeeWeb.linux.x64.zip -C keeweb
}

package() {
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -m644 "${srcdir}/keeweb/resources/app/icon.png" "${pkgdir}/usr/share/pixmaps/keeweb.png"

    install -dm755 "${pkgdir}/usr/share/applications"
    install -m644 "${srcdir}/keeweb.desktop" "${pkgdir}/usr/share/applications/keewee.desktop"

    cp --preserve=mode -r "${srcdir}/keeweb" "${pkgdir}/usr/share/"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /usr/share/keeweb/KeeWeb "${pkgdir}/usr/bin/keeweb"
}
