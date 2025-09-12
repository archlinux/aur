# Maintainer: Lyna Stral <testerthe60@gmail.com>

_pkgname=netsleuth
pkgname="$_pkgname"-git
pkgver=v1.1.1.r11.g298ba39
pkgrel=1
pkgdesc='A simple utility for the calculation and analysis of IP subnet values, designed to simplify network configuration tasks.'
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
