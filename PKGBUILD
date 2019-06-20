# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal-shecal
pkgver=0.1.1
pkgrel=1
pkgdesc="shell for eCAL"
arch=('x86_64')
url="https://github.com/Blutkoete/shecal"
license=('BSD')
depends=('ecal')
makedepends=('boost' 'cmake')
optdepends=()
source=(https://github.com/Blutkoete/shecal/archive/v$pkgver.tar.gz)
sha256sums=('6463ffdad93f1ca83647369cec1917a05cc4caea3553e6804eceab4ef8921503')

build() {
	cd shecal-$pkgver
	mkdir -p build
	cd build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
		 -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd shecal-$pkgver
	cd build
	DESTDIR="$pkgdir" make install
	mkdir -p $pkgdir/usr/share/licenses/shecal
	cp $srcdir/shecal-$pkgver/LICENSE $pkgdir/usr/share/licenses/shecal/LICENSE
}
