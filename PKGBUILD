# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt5
pkgver=2.1.4
pkgrel=0
pkgdesc='Music player for the large local collections (Qt5 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-svg' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient' 'cpptrace', 'libebur128', 'sqlite3')
makedepends=('cmake')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/558b1581265f41584022040f88da8eb54ab60ab9.zip")
sha256sums=('f78f1eda8e70dcf2b7b73e9316ddfaaa3c2fe053e39919d54e01d31940883643')

build() {
    cd mpz-558b1581265f41584022040f88da8eb54ab60ab9

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON -DUSE_QT5=ON -DUSE_SYSTEM_LIBMPDCLIENT=ON -DUSE_SYSTEM_CPPTRACE=ON -DUSE_SYSTEM_LIBEBUR128=ON -DUSE_SYSTEM_SQLITE3=ON ..
    cmake --build .
}

package() {
    cd mpz-558b1581265f41584022040f88da8eb54ab60ab9

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
