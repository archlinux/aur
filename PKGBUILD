# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=buildbox-casd
pkgver=0.0.5
pkgrel=1
pkgdesc="Local cache and proxy for remote CAS servers"
arch=(x86_64)
url="https://buildgrid.build"
license=('Apache')
depends=('buildbox-common')
makedepends=('cmake' )
source=("https://gitlab.com/BuildGrid/buildbox/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('cff100b0afcd013f43757a1a9a2e0fdf03894bf0680592d1f3b643c26ea29698')

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
