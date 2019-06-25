# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal-shecal
pkgver=0.2.0
pkgrel=1
pkgdesc="shell for eCAL"
arch=('x86_64')
url="https://github.com/Blutkoete/shecal"
license=('BSD')
depends=('ecal')
makedepends=('boost' 'cmake')
optdepends=()
source=(https://github.com/Blutkoete/shecal/archive/v$pkgver.tar.gz)
sha256sums=('9d40daf0bc86fa9746cb2e591f1be62cca5bd356ea7423f0a869a0222ca92e95')

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
