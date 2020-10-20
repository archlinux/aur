# Maintainer: Quentin Barbarat <q DOT barbarat AT gmail DOT com>
pkgname=gba-tileeditor-git
url="https://github.com/quentin-dev/gba-tileeditor"
_gitname=gba-tileeditor
pkgver=0.0.10.r3.gc5e7c0d
pkgrel=1
pkgdesc="A Gameboy Advance tile editor"
arch=(x86_64)
license=('MIT')
depends=('qt5-base')
makedepends=('qt5-base' 'git' 'make')
source=("$pkgname::git+https://github.com/quentin-dev/gba-tileeditor#branch=master" "gba-tileeditor-git.desktop")
md5sums=('SKIP' '847b6674e02e552783e6db33a11b6e53')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname}"
    qmake gba-tileeditor-client/gba-tileeditor-client.pro
    make
}

package() {
    install -D -m 644 gba-tileeditor-git.desktop ${pkgdir}/usr/share/applications/gba-tileeditor-git.desktop
    cd "${srcdir}/${pkgname}"
    install -D -m 755 gba-tileeditor ${pkgdir}/usr/bin/gba-tileeditor-git
}
