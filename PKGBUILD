# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-ale-py
pkgver=0.7.5
pkgrel=1
pkgdesc="The Arcade Learning Environment (ALE) - a platform for AI research."
arch=('x86_64')
url="https://github.com/mgbellemare/Arcade-Learning-Environment"
license=('MIT')
makedepends=("cmake" "vcpkg" "python-pytest")
_name="Arcade-Learning-Environment"
source=("$pkgname-$pkgver.tar.gz::https://github.com/mgbellemare/$_name/archive/v$pkgver.tar.gz")
md5sums=('f6c0d5298b0a2ce469902f188271acb4')

build() {
    cmake -B build -S "${_name}-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

check() {
    cd build
    ctest --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
