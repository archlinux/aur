pkgname='holo-run-scripts'
pkgver=1.3
pkgrel=1
pkgdesc='Holo plugin for running custom provisioning scripts'
arch=('any')
url='http://holocm.org'
license=('GPL3')
depends=(
    'HOLO_API_VERSION=3'
)
makedepends=('perl')
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('695cd2513a536a3ae1f583d4687f498c0576fd5689aa8f88e023d191a4ed85e8')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s/^VERSION :=.*/VERSION := ${pkgver}/" Makefile
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
