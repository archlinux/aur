# This PKGBUILD is maintained at: https://github.com/majewsky/system-configuration/tree/master/holo
pkgname='holo'
pkgver=0.5.0
pkgrel=2
pkgdesc='Minimalistic configuration management'
arch=('x86_64')
url='http://holotools.org'
license=('GPL2')
depends=('shadow')
makedepends=('go')
source=("https://github.com/holocm/holo/archive/v${pkgver}.tar.gz")
md5sums=('034048a85d55201895503c421afd71f3')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # work around a typo in the v0.5.0 Makefile
    sed -i 's/\<utils\>/util/g' Makefile
    make
}

# NOTE: We cannot check() here since the "make check" only runs correctly inside a Git clone of Holo.

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make install DESTDIR="${pkgdir}"
}
