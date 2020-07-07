# Maintainer: Quentin Barbarat <q DOT barbarat AT gmail DOT com>
pkgname=gba-tileeditor-git
url="https://github.com/quentin-dev/gba-tileeditor"
_gitname=gba-tileeditor
pkgver=0.0.4
pkgrel=1
pkgdesc="A Gameboy Advance tile editor"
arch=(x86_64)
license=('MIT')
depends=('qt5-base')
makedepends=('qt5-base' 'git')
source=("$pkgname::git+https://github.com/quentin-dev/gba-tileeditor#branch=master")
md5sums=("SKIP")

prepare() {
    cd "${srcdir}/${pkgname}"
    git checkout "v${pkgver}"
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --tags $(git rev-list --tags --max-count=1) | tail -c +2
}

build() {
    cd "${srcdir}/${pkgname}"
    qmake gba-tileeditor.pro
    make -j$(nproc)
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m 755 gba-tileeditor ${pkgdir}/usr/bin/gba-tileeditor
    install -D -m 644 gba-tileeditor.desktop ${pkgdir}/usr/share/applications/gba-tileeditor.desktop
}