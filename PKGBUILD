# Maintainer: Hoream <hoream@qq.com>

_pkgname=netsleuth
pkgname=netsleuth-git
pkgver=v1.0.5.r3.g0de97d2
pkgrel=1
pkgdesc=' A simple utility for the calculation and analysis of IP subnet values, designed to simplify network configuration tasks.'
url="https://github.com/vmkspv/netsleuth"
arch=('any')
license=('GPL3')
depends=('gtk4' 'python-gobject' 'libadwaita' 'gtk-update-icon-cache')
makedepends=('git' 'meson')
source=("${_pkgname}::git+${url}")
sha1sums=('SKIP')


pkgver() {
    cd $srcdir/${_pkgname}
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $srcdir/${_pkgname}
    meson --prefix /usr build
}

package() {
    cd $srcdir/${_pkgname}
    DESTDIR="$pkgdir" meson install -C build
    chmod +x ${pkgdir}/usr/bin/${_pkgname}
}

