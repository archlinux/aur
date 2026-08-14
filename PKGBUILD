# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.1.3
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('qt6-multimedia' 'qt6-svg' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient' 'cpptrace')
makedepends=('cmake')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/51d9284c7323dfce896e0f24278007846ea26807.zip")
sha256sums=('823bbf376f3fce664cc37184508c92b4b68f1228a9f3470e1a7706669da6a3eb')

build() {
    cd mpz-51d9284c7323dfce896e0f24278007846ea26807

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON -DUSE_SYSTEM_LIBMPDCLIENT=ON -DUSE_SYSTEM_CPPTRACE=ON ..
    cmake --build .
}

package() {
    cd mpz-51d9284c7323dfce896e0f24278007846ea26807

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
