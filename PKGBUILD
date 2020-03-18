# Maintainer: Thore Bödecker <foxxx0@archlinux.org>

pkgname=babeltrace2
_pkgname="${pkgname%2}"
pkgver=2.0.2
pkgrel=1
pkgdesc="Command-line trace converter (V2)"
arch=('x86_64')
url="https://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1' 'BSD2')
depends=('popt' 'util-linux' 'glib2' 'elfutils')
makedepends=('popt' 'util-linux' 'glib2' 'elfutils' 'asciidoc' 'xmlto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/efficios/babeltrace/archive/v${pkgver}.tar.gz")
sha512sums=('330f55f625225a2f11b6bd4214931225d08df416e8cff07727ba07cb78ea99856a951b8fb2d3fd28cf537e96a0ff14539bd6d60202f75088ae7821f6282db573')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    autoreconf --install
    ./configure --prefix='/usr'
    make
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
