# Maintainer: Cirk2 <privat+aur at cirk2 dot de> 

pkgname=sdbus-cpp-git
pkgver=r179.cc49581
pkgrel=1
pkgdesc="sdbus-c++ is a high-level C++ D-Bus library for Linux designed to provide expressive, easy-to-use API in modern C++"
url="https://github.com/Kistler-Group/sdbus-cpp"
arch=('i686' 'x86_64')
license=('LGPLv2.1')
depends=('systemd-libs')
makedepends=('cmake')
provides=('sdbus-cpp')
conflicts=('sdbus-cpp')
source=("${pkgname}::git+https://github.com/Kistler-Group/sdbus-cpp.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cmake "$srcdir/${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_CODE_GEN=ON \
        -DBUILD_DOXYGEN_DOC=ON
    make
    make doc
}

package() {
    make DESTDIR="$pkgdir" install
}

