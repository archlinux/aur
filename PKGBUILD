pkgname='holo-run-scripts'
pkgver=1.3.1
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
sha256sums=('3660714e39ea34cbfceda8e24147fc8c5ade89e3187b392664d9c3500c18ae41')
backup=(
    'etc/holorc.d/95-holo-run-scripts'
)

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
