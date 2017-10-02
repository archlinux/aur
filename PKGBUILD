# Maintainer: voropaev.roma@gmail.com

pkgname=dbglass-bin
pkgver=0.1.0
_pkgver_extra=beta.6
pkgrel=1
pkgdesc="Simple cross-platform PostgreSQL client. Built with Electron, React, Redux, FixedDataTable."
license=('MIT')
arch=('x86_64')
url="https://github.com/web-pal/DBGlass"
makedepends=('npm')
source=("${url}/releases/download/v${pkgver}-${_pkgver_extra}/linux-x64.tar.gz" "DBGlass.desktop")
sha1sums=('2477e8974f7309dd53cefe6eaa12761cd20b662b'
            'cba58f494602974cd968777ece6cb4ec963492cc')

package() {
    # Copy files to /opt
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cp --preserve=mode -r DBGlass-linux-x64/* "${pkgdir}/opt/${pkgname}"

    # Copy icon
    install -Dm755 DBGlass-linux-x64/resources/app/logo/logo.png "${pkgdir}/usr/share/icons/hicolor/256x256/dbglass.png"

    # Exec link
    mkdir -p "${pkgdir}/usr/local/bin"
    ln -s "${pkgdir}/opt/${pkgname}/DBGlass" "${pkgdir}/usr/local/bin/dbglass"

    # Desktop file
    install -Dm755 DBGlass.desktop "${pkgdir}/usr/share/applications/DBGlass.desktop"
}
