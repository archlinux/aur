# Maintainer: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Philippe Proulx <pproulx@efficios.com>
# Contributor: Manuel Mendez <mmendez534 at gmail dot com>

pkgname=babeltrace
pkgver=1.5.11
pkgrel=1
pkgdesc="Command-line trace converter"
arch=('x86_64')
url="https://diamon.org/babeltrace"
license=('MIT' 'GPL2' 'LGPL2.1')
depends=('popt' 'util-linux' 'glib2' 'elfutils')
makedepends=('popt' 'util-linux' 'glib2' 'elfutils')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/efficios/babeltrace/archive/v${pkgver}.tar.gz")
sha512sums=('53353c54751104685af721ca39756f5f0f5c6f4d69ecafba72afeda8755b63163fbd1daaa36abaf582735c819d9b3276b3a78c2a958d989ffa5827cb9b85aa0f')

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
