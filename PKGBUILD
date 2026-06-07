# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt5
pkgver=2.0.10
pkgrel=0
pkgdesc='Music player for the large local collections (Qt5 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/7ada76ad2a4d3c96eb9aa682aae8c6454ad358b2.zip")
sha256sums=('ff9263333652a20d59a6b402f6372f0566efd18aea0776cc8b859eeff6b20e06')

build() {
    cd mpz-7ada76ad2a4d3c96eb9aa682aae8c6454ad358b2

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON -DUSE_QT5=ON -DUSE_SYSTEM_LIBMPDCLIENT=ON ..
    cmake --build .
}

package() {
    cd mpz-7ada76ad2a4d3c96eb9aa682aae8c6454ad358b2

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
