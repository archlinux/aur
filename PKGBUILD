# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=brahms-git
pkgver=0.7.3+git32ca5f7
pkgrel=2
pkgdesc="The BRAHMS simulation execution engine"
arch=(i686 x86_64)
url="https://github.com/BRAHMS-SystemML/brahms"
groups=()
depends=(python zlib)
makedepends=(git cmake)
provides=("brahms")
conflicts=("brahms")
source=("git+$url")
md5sums=(SKIP)

pkgver() {
	cd "brahms"
	echo 0.7.3+git$(git rev-parse --short HEAD)
}

prepare() {
	cd "brahms"
	rm -rf build
	mkdir build
	cd build
	cmake -DSTANDALONE_INSTALL=ON -DCOMPILE_WITH_X11=OFF -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
	cd "brahms/build"
	make
}

package() {
	cd "brahms/build"
	make DESTDIR="$pkgdir" install
}
