pkgname='holo-run-scripts'
pkgver=1.2
pkgrel=2
pkgdesc='Holo plugin for running custom provisioning scripts'
arch=('any')
url='http://holocm.org'
license=('GPL3')
depends=(
    'HOLO_API_VERSION=3'
)
makedepends=('perl')
install='holo-run-scripts.install'
source=("https://github.com/holocm/${pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('797a28048302ba8a2efbd64b542bec0b')

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
    install -d -m0755 "${pkgdir}/usr/share/holo/run-scripts"
}
