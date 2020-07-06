# Maintainer: Quentin Barbarat <q DOT barbarat AT gmail DOT com>
pkgname=gba-tileeditor-git
url="https://github.com/quentin-dev/gba-tileeditor"
_gitname=gba-tileeditor
pkgver=0.0.1.r1.g965dfbb
pkgrel=1
pkgdesc="A Gameboy Advance tile editor"
arch=(x86_64)
license=('MIT')
depends=('qt5-base')
makedepends=('qt5-base' 'git')
source=("$pkgname::git+https://github.com/quentin-dev/gba-tileeditor#branch=master")
md5sums=("SKIP")

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

build() {
    cd "${srcdir}/${pkgname}"
    qmake gba-tileeditor.pro
    make -j8
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D -m 755 gba-tileeditor ${pkgdir}/usr/bin/gba-tileeditor
    install -D -m 644 gba-tileeditor.desktop ${pkgdir}/usr/share/applications/gba-tileeditor.desktop
}