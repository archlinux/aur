pkgname='holo-build'
pkgver=1.1
pkgrel=1
pkgdesc='Cross-distribution system package compiler'
arch=('i686' 'x86_64')
url='http://holocm.org'
license=('GPL3')
depends=(
    'pacman' # used by the pacman generator to resolve package groups
    'xz'
)
makedepends=('go' 'perl')
source=("https://github.com/holocm/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
md5sums=('0911ba457d288f5f2adc4fffb53269b5')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # correct various typos in the Makefile of this version
    sed -i 's/^VERSION := .*$/VERSION := '${pkgver}/ Makefile
    sed -i 's/vERSION/VERSION/' Makefile
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
