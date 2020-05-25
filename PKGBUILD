# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-common
pkgver=0.0.8
pkgrel=1
pkgdesc="Shared protocol-buffer definitions and various helper functions"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('grpc' 'gtest' 'gmock')
makedepends=('cmake')
source=("https://gitlab.com/BuildGrid/buildbox/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('db7dfbde67a62aafc915e32422fd2460cc6f3da3562825aeab5a4decafc017c1')

build() {
    [ -d build ] && rm -rf build; mkdir build
    cd build
    cmake ../"$pkgname-$pkgver"     \
        -DCMAKE_BUILD_TYPE=Release  \
        -DCMAKE_INSTALL_PREFIX=/usr
    make
}

# Fails on merklize
check() {
    cd build
    make -k test
}

package() {
    cd build
    make DESTDIR="$pkgdir/" install
}
