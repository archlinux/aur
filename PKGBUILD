# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-casd
pkgver=0.0.8
pkgrel=1
pkgdesc="Local cache and proxy for remote CAS servers"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('buildbox-common')
makedepends=('cmake' )
source=("https://gitlab.com/BuildGrid/buildbox/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('48613dfef451291f447c9c7c7ad7ea29b3ea1e35ce25d47771c1761d9985eda3')

build() {
    [ -d build ] && rm -rf build; mkdir build
    cd build
    cmake ../"$pkgname-$pkgver"     \
        -DCMAKE_BUILD_TYPE=Release  \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

check() {
    cd build
    make -k test
}

package() {
    cd build
    make DESTDIR="$pkgdir/" install
}
