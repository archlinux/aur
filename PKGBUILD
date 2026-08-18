# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.1.4
pkgrel=3
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'qt6-svg' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient' 'cpptrace' 'libebur128' 'sqlite3')
makedepends=('cmake')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/829ea75d58d20b42e41a8a420ea08336717aad18.zip")
sha256sums=('476ecb95ada30ab39ecd4cd03fa3707fcd5cb1a7e4bc852e13ebbe2e1d6e0bb7')

build() {
    cd mpz-829ea75d58d20b42e41a8a420ea08336717aad18

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON -DUSE_SYSTEM_LIBMPDCLIENT=ON -DUSE_SYSTEM_CPPTRACE=ON -DUSE_SYSTEM_LIBEBUR128=ON -DUSE_SYSTEM_SQLITE3=ON ..
    cmake --build .
}

package() {
    cd mpz-829ea75d58d20b42e41a8a420ea08336717aad18

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
