# Maintainer: Nils Schulte <aur@nilsschulte.de>

pkgname=waybind-git
_pkgname=waybind
pkgver=v0.1.1.r2.g2e976d7
pkgrel=1
pkgdesc='Simple Key rebinder'
arch=('x86_64')
url='https://github.com/arnarg/waybind'
license=('MIT')
makedepends=('git' 'go')
provides=('waybind')
conflicts=('waybind')
source=("$_pkgname::git+https://github.com/arnarg/waybind")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    make PREFIX=/usr VERSION="$(pkgver)"
}

package() {
    cd "$srcdir/$_pkgname"
    mkdir -p "${pkgdir}/usr/bin/"
    mv waybind "${pkgdir}/usr/bin/waybind"
}
