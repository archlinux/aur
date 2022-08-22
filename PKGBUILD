# Contributor: Westly Ward <sonicrules1234 at gmail dot com>
# Contributor: anze <alberto.anzellotti@gmail.com>
# Maintainer: Matrix <thysupremematrix at tuta dot io

pkgname=nsfminer-git
pkgver=1.3.12.r141.g484ae84c0
pkgrel=1
pkgdesc="Ethereum miner with OpenCL and CUDA support derived from ethminer. RTX 30 series compatible."
arch=('x86_64')
url="https://github.com/Titaniumtown/nsfminer"
license=('GPL3')
depends=('mesa')
makedepends=('cmake>=3.5' "git" "perl" "python3" "cuda>=9.0")
provides=('nsfminer')
conflicts=('nsfminer')
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $pkgname
	git submodule update --init --recursive
	mkdir -p build	
	cmake -B build -S . \
		-DCMAKE_INSTALL_PREFIX='/usr' 
	cmake --build build
}

package() {
	cd "$pkgname/build"
	make DESTDIR=$pkgdir install
}
