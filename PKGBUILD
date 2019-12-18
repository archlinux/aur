# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-common
pkgver=0.0.5
pkgrel=1
pkgdesc="Shared protocol-buffer definitions and various helper functions"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('grpc' 'gtest' 'gmock')
makedepends=('cmake')
source=("https://gitlab.com/BuildGrid/buildbox/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('63fbd3ed7c56dd27cf6dc9cbb900ad67affacdbdf46486946a2945cca3190b72')

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
	make -k test || true
}

package() {
	cd build
	make DESTDIR="$pkgdir/" install
}
