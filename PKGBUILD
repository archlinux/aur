# Maintainer: Tobias Markus < tobias AT miglix DOT eu >
# Contributor: Samuel Mesa <samuelmesa@linuxmail.org>

pkgname=gpstk
pkgver=2.12.1
pkgrel=1
pkgdesc="Algorithms and frameworks supporting the development of processing and analysis applications in navigation and global positioning"
url="http://www.gpstk.org"
license=('LGPL')
depends=()
makedepends=('cmake')
provides=('gpstk')
conflicts=('gpstk')
arch=('x86_64')
source=("https://gitlab.com/sgl-ut/GPSTk/-/archive/v${pkgver}/GPSTk-v${pkgver}.tar.gz")
sha256sums=('0c4442126654857a424584263c9f6a40871c492fc98f7b59bf7122051a2d9dba')

build() {
    cd "${srcdir}"

    export CFLAGS+=" ${CPPFLAGS}"
    export CXXFLAGS+=" ${CPPFLAGS} -Wno-deprecated"
    cmake -B build \
        -S "GPSTk-v${pkgver}" \
        -Wno-dev \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=None \
        -DUSE_RPATH=OFF

    make -C build
}

package() {
    cd "${srcdir}"

    make -C build DESTDIR="${pkgdir}" install
}
