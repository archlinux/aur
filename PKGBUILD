# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt5
pkgver=2.0.17
pkgrel=0
pkgdesc='Music player for the large local collections (Qt5 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient' 'cpptrace')
makedepends=('cmake')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/67c0ddc9cc4c0da6918101a5fdf7aa288b43c28b.zip")
sha256sums=('eb8c973ea37be59e52d2bc9299bbc697223ba50dbdc57a8c28ffe265301584f3')

build() {
    cd mpz-67c0ddc9cc4c0da6918101a5fdf7aa288b43c28b

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON -DUSE_QT5=ON -DUSE_SYSTEM_LIBMPDCLIENT=ON -DUSE_SYSTEM_CPPTRACE=ON ..
    cmake --build .
}

package() {
    cd mpz-67c0ddc9cc4c0da6918101a5fdf7aa288b43c28b

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
