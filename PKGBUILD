# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=babeltrace
pkgver=1.5.7
pkgrel=1
pkgdesc="Command-line trace converter"
arch=('x86_64')
url="https://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1')
depends=('popt' 'util-linux' 'glib2' 'elfutils')
makedepends=('popt' 'util-linux' 'glib2' 'elfutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/efficios/babeltrace/archive/v${pkgver}.tar.gz")
sha512sums=('044c06e0f1fe0844f30c7c21181e9a548f20cf80938e4f4a1aff3e0fcafd69faee89df81b8fb1d6574526b4275195f0068d1967778dc354641612c1982e1be26')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    autoreconf --install
    ./configure --prefix='/usr'
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
