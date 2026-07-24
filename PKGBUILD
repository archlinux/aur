# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt5
pkgver=2.1.1
pkgrel=0
pkgdesc='Music player for the large local collections (Qt5 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient' 'cpptrace')
makedepends=('cmake')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/acb3fc3fdf76564c04d68948b97ff8c11c494db7.zip")
sha256sums=('86076985c78406be94abe2c6807b63405834c24b8a5392f02544ff7ebffbcaf3')

build() {
    cd mpz-acb3fc3fdf76564c04d68948b97ff8c11c494db7

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON -DUSE_QT5=ON -DUSE_SYSTEM_LIBMPDCLIENT=ON -DUSE_SYSTEM_CPPTRACE=ON ..
    cmake --build .
}

package() {
    cd mpz-acb3fc3fdf76564c04d68948b97ff8c11c494db7

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
