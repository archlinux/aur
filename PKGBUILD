# Maintainer: Christoph Sterz <christoph.sterz@kdab.com>
pkgname=kdchart
pkgver=2.7.0
pkgrel=1
arch=('x86_64')
pkgdesc="A Qt tool for creating business and scientific charts."
license=("GPL2" "custom:KDAB commercial license")
depends=('qt5-base')
makedepends=('cmake' 'ninja' 'qt5-tools')
url="https://www.kdab.com/kd-chart/"
source=("https://github.com/KDAB/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('22088fe2e7173f160a4c6cc0b1d50e785d61ff7bab56df851d64788c6f3ced0b')

prepare() {
    mkdir -p build
}

build() {
    cd build
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DKDChart_EXAMPLES=OFF \
        -DDISABLE_PYTHON_BINDINGS=true \
        -G Ninja \
        ../KDChart-${pkgname}-${pkgver}
    ninja
}

package() {
    cd build
    DESTDIR="${pkgdir}" ninja install
}
