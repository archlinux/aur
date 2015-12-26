# Maintainer: Adam Ehlers Nyholm Thomsen<adament@adament.net>
pkgname=davix
pkgver=0.4.0
pkgrel=1
pkgdesc="A client for optimized remote I/O, data management and large collections of file management over the WebDav, Amazon S3, Microsoft Azure and HTTP protocols."
arch=('i686' 'x86_64')
url="https://dmc.web.cern.ch/projects/davix/home"
license=('LGPL2.1')
depends=('openssl' 'libxml2' 'boost-libs')
makedepends=('doxygen' 'boost')
checkdepends=('gtest')
optdepends=()
conflicts=(davix-git)
source=("https://grid-deployment.web.cern.ch/grid-deployment/dms/lcgutil/tar/davix/davix-0.4.0.tar.gz")
sha256sums=('39ed8b4522a1c1d064a916f4cfd0aefa66151f57271669b0529ec3d55d170762')

build() {
	cd "$pkgname-$pkgver"
	cmake -DLIB_SUFFIX="" -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release .
	make
	make doc
}

check() {
	cd "$pkgname-$pkgver"
	cmake . -DUNIT_TESTS=TRUE
	make
	make test
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
