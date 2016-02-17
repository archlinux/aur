pkgname='holo-build'
pkgver=1.1.1
pkgrel=1
pkgdesc='Cross-distribution system package compiler'
arch=('i686' 'x86_64' 'armv7h')
url='http://holocm.org'
license=('GPL3')
depends=(
    'pacman' # used by the pacman generator to resolve package groups
    'xz'
)
makedepends=('go' 'perl')
source=("https://github.com/holocm/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('a87f113f5248caf80f1767d561f98ecd')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # version detection from release tarball is broken in this version
    sed -i 's/^VERSION := .*$/VERSION := '${pkgver}/ Makefile
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make check
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
