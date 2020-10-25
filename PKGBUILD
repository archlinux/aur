# Maintainer: Quentin Barbarat <q DOT barbarat AT gmail DOT com>
pkgname=gba-tileeditor
url="https://github.com/quentin-dev/gba-tileeditor"
_gitname=gba-tileeditor
pkgver=0.0.11
pkgrel=1
pkgdesc="A Gameboy Advance tile editor"
arch=(x86_64)
license=('MIT')
depends=('qt5-base')
makedepends=('qt5-base' 'git' 'make' 'cmake')
source=("$pkgname::git+https://github.com/quentin-dev/gba-tileeditor#branch=master" "gba-tileeditor.desktop")
md5sums=("SKIP" "6180eaeb3698e6db5fe1b95a2e2e4be1")

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags $(git rev-list --tags --max-count=1) | tail -c +2
}

build() {
    cd "${srcdir}/${pkgname}"
    git checkout "v${pkgver}"
    cmake -S . -B build
    cmake --build build
}

package() {
    install -D -m 644 gba-tileeditor.desktop ${pkgdir}/usr/share/applications/gba-tileeditor.desktop
    cd "${srcdir}/${pkgname}"
    install -D -m 755 build/gba-tileeditor-client/gba-tileeditor ${pkgdir}/usr/bin/gba-tileeditor
}
