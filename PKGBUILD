# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Markus Martin <markus@archwyrm.net>
pkgname=yaml-cpp0.3
pkgver=0.3.0
pkgrel=2
pkgdesc="YAML parser and emitter in C++, written around the YAML 1.2 spec"
url="https://github.com/jbeder/yaml-cpp"
arch=(x86_64)
license=('MIT')
makedepends=('cmake')
conflicts=("yaml-cpp")
provides=("yaml-cpp=${pkgver}")
source=("${url}/archive/release-${pkgver}.tar.gz")
sha256sums=('ab8d0e07aa14f10224ed6682065569761f363ec44bc36fcdb2946f6d38fe5a89')

build() {
    cd "${srcdir}/yaml-cpp-release-${pkgver}"

    rm -rf build
    mkdir -p build
    cd build

    cmake ..                      \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DBUILD_SHARED_LIBS=ON
    make
}

package() {
    cd "${srcdir}/yaml-cpp-release-${pkgver}/build"

    make DESTDIR="${pkgdir}" install
}
