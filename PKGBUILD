# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz
pkgver=2.0.3
pkgrel=0
pkgdesc='Music player for the large local collections'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt6-multimedia' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient')
provides=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/0cf74fc8c54d3361ac460abfa308925602abeee2.zip")
sha256sums=('3a1fcf17ed8b35b2991b1429917e794b75d0f21c7bad9253c2ec2ef15e0e98c4')

build() {
    cd mpz-0cf74fc8c54d3361ac460abfa308925602abeee2

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON ..
    cmake --build .
}

package() {
    cd mpz-0cf74fc8c54d3361ac460abfa308925602abeee2

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
