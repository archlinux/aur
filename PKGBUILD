# Maintainer: iboyperson <iboyperson@gmail.com>

pkgname=plasma5-applets-caffeine-plus
_reponame=plasma-applet-caffeine-plus
pkgver=1.4
pkgrel=2
pkgdesc="Disable screensaver and auto suspend"
arch=('i686' 'x86_64')
url="https://github.com/qunxyz/plasma-applet-caffeine-plus"
license=('GPL2')
makedepends=(
	gcc
	make
	cmake
	extra-cmake-modules
	pkg-config
	qconf
	plasma-framework
)
provides=("plasma5-applets-caffeine-plus")
conflicts=("plasma5-applets-caffeine-plus")
source=("https://github.com/qunxyz/$_reponame/archive/v$pkgver.tar.gz")
sha256sums=('f15ac283d5adbdbd909dc76b258aa406b7ba05d0156bef76c9632ef7da67ce8f')

prepare() {
	cd "$srcdir/$_reponame-$pkgver"
	
	mkdir -p build
}

build() {
	cd "$srcdir/$_reponame-$pkgver"
	cd build
	
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	make
}

package() {
	cd "$srcdir/$_reponame-$pkgver"
	cd build

	make DESTDIR="$pkgdir/" install
}
