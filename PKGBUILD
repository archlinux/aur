# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.1.9
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'qt6-svg' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient' 'cpptrace' 'libebur128' 'sqlite3')
makedepends=('cmake')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/2d2f2ea294b91d1c0fcef306b2c3390084299ec7.zip")
sha256sums=('22c254127d053e320bea5657c7bcc939b2eded05db78096825876e84d9841d2a')

build() {
    cd mpz-2d2f2ea294b91d1c0fcef306b2c3390084299ec7

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUSE_SYSTEM_TAGLIB=ON \
          -DUSE_SYSTEM_YAMLCPP=ON \
          -DUSE_SYSTEM_LIBMPDCLIENT=ON \
          -DUSE_SYSTEM_CPPTRACE=ON \
          -DUSE_SYSTEM_LIBEBUR128=ON \
          -DUSE_SYSTEM_SQLITE3=ON \
          ..
    cmake --build .
}

package() {
    cd mpz-2d2f2ea294b91d1c0fcef306b2c3390084299ec7

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
