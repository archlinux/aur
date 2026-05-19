# Maintainer: Oleg Antonyan <oleg.b.antonyan@gmail.com>
# Contributor: Oleg Antonyan <oleg.b.antonyan@gmail.com>

pkgname=mpz-qt5
pkgver=2.0.7
pkgrel=0
pkgdesc='Music player for the large local collections (Qt5 version)'
arch=('x86_64')
url="https://github.com/olegantonyan/mpz"
license=('GPL3')
depends=('cmake' 'qt5-multimedia' 'qt5-x11extras' 'hicolor-icon-theme' 'yaml-cpp' 'taglib' 'libmpdclient')
provides=('mpz')
conflicts=('mpz')
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/olegantonyan/mpz/archive/fdf36fae739bd3d2b3751c31f2206b94583dadc1.zip")
sha256sums=('6b8fa4e477c623f6b7f87b4667c77cdd338243dd955556714387709b060f4056')

build() {
    cd mpz-fdf36fae739bd3d2b3751c31f2206b94583dadc1

    rm -rf build
    mkdir build
    cd build
    cmake -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DUSE_SYSTEM_TAGLIB=ON -DUSE_SYSTEM_YAMLCPP=ON -DUSE_QT5=ON -DUSE_SYSTEM_LIBMPDCLIENT=ON ..
    cmake --build .
}

package() {
    cd mpz-fdf36fae739bd3d2b3751c31f2206b94583dadc1

    cd build
    DESTDIR="$pkgdir" cmake --install .
}
