# Maintainer: Tobias Borgert <tobias.borgert@gmail.com>

pkgname=ecal-shecal
pkgver=0.2.1
pkgrel=1
pkgdesc="shell for eCAL"
arch=('x86_64')
url="https://github.com/Blutkoete/shecal"
license=('BSD')
depends=('ecal')
makedepends=('boost' 'cmake')
optdepends=()
source=(https://github.com/Blutkoete/shecal/archive/v$pkgver.tar.gz)
sha256sums=('0ae551e7fcc9c7b86d33143fa92436e68040dbcaf4459eb4f8ce4f37b91ccfab')

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
