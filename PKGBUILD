# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.1.8
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'qt6-svg' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient' 'cpptrace' 'libebur128' 'sqlite3')
makedepends=('cmake')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/1390a10da36674689b81de7262f5fbbba39263a4.zip")
sha256sums=('25f8da466d7ede972b74cf3491b6def005977ef797da5248dbf46fd946647eea')

build() {
    cd mpz-1390a10da36674689b81de7262f5fbbba39263a4

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
    cd mpz-1390a10da36674689b81de7262f5fbbba39263a4

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
