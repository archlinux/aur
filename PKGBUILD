# Maintainer: Ishan Parihar <ishanparihar@gmail.com>
pkgname='notion-calendar-electron-fixed'
pkgver=1.0.6
pkgrel=1
pkgdesc='A Electron-based Notion Calendar client (opens external links in default browser)'
arch=('x86_64')
url=https://www.notion.so/product/calendar
license=(MIT)
depends=("electron")
makedepends=('npm' 'git')
provides=('notion-calendar-electron')
source=("https://github.com/ishan-parihar/notion-calendar-electron/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --no-fund --no-audit
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/notion-calendar-electron"
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/applications"
    mkdir -p "${pkgdir}/usr/share/pixmaps"
    
    # Copy app files
    cp index.js "${pkgdir}/usr/share/notion-calendar-electron/"
    cp -r node_modules "${pkgdir}/usr/share/notion-calendar-electron/"
    cp icon.png "${pkgdir}/usr/share/notion-calendar-electron/"
    cp notion-calendar-electron.desktop "${pkgdir}/usr/share/applications/"
    
    # Create launcher script
    echo '#!/bin/sh' > "${pkgdir}/usr/bin/notion-calendar-electron"
    echo 'exec electron /usr/share/notion-calendar-electron/index.js "$@"' >> "${pkgdir}/usr/bin/notion-calendar-electron"
    chmod +x "${pkgdir}/usr/bin/notion-calendar-electron"
}
