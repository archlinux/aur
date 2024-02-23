# Maintainer: Christof Zlabinger <stoffi05@pm.me>
pkgname='notion-calendar-electron'
pkgver=1.119.0
pkgrel=1
pkgdesc='A Electron-based Notion Calendar client'
arch=('x86_64')
url=https://www.notion.so/product/calendar
license=(MIT)
depends=("electron")
makedepends=('npm' 'git')
provides=('notion-calendar-electron')
source=("https://github.com/czlabinger/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    tar -xf "v${pkgver}.tar.gz" -C "${srcdir}/${pkgname}-${pkgver}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm install --no-fund --no-audit
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm run build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir -p "$pkgdir/usr/share/notion-calendar-electron"
    mkdir -p "$pkgdir/usr/bin"
    cp -r "dist/linux-unpacked" "$pkgdir/usr/share/notion-calendar-electron"
    ln -s "$pkgdir/usr/share/notion-calendar-electron/linux-unpacked/notion-calendar-electron" "$pkgdir/usr/bin/"
}
