# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.1.7
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'qt6-svg' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient' 'cpptrace' 'libebur128' 'sqlite3')
makedepends=('cmake')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/c18ca4767e68ebb1329891e0cd16bc0682f2785d.zip")
sha256sums=('5c16cfffba3244b1c0be80b4b0a3fa15d47bfb81565fd1f4cdd10563313bef34')

build() {
    cd mpz-c18ca4767e68ebb1329891e0cd16bc0682f2785d

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
    cd mpz-c18ca4767e68ebb1329891e0cd16bc0682f2785d

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
