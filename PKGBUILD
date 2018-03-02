# Maintainer: iboyperson <iboyperson@gmail.com>

pkgname=plasma5-applets-caffeine-plus
_reponame=plasma-applet-caffeine-plus
pkgver=1.3
pkgrel=2
pkgdesc="Disable screensaver and auto suspend"
arch=('i686' 'x86_64')
url="https://github.com/qunxyz/plasma-applet-caffeine-plus"
makedepends=(
	gcc
	make
	cmake
	extra-cmake-modules
	pkg-config
)
provides=("plasma5-applets-caffeine-plus")
conflicts=("plasma5-applets-caffeine-plus")
source=("https://github.com/qunxyz/plasma-applet-caffeine-plus/archive/v$pkgver.tar.gz")
sha256sums=('935beb6d536e1dba81b320d9f6c27dff2d96ad85f40ea608ae7ea63ec6ea5521')

prepare() {
	cd "$srcdir/$_reponame-$pkgver"
	
	mkdir -p build
}

build() {
	cd "$srcdir/$_reponame-$pkgver"
	cd build
	
	cmake .. -DCMAKE_BUILD_TYPE=Release -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
	make
}

package() {
	cd "$srcdir/$_reponame-$pkgver"
	cd build

	make DESTDIR="$pkgdir/" install
}
