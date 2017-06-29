# Maintainer: Dominic Radermacher <blip@mockmoon-cybernetics.ch>
pkgbase='mariadb-connector-c'
pkgname=lib32-${pkgbase}
pkgver=2.3.3
pkgrel=1
pkgdesc='MariaDB connector libraries for C/C++'
arch=('x86_64')
license=('GPL')
url='http://mariadb.org/'
depends=('lib32-openssl')
makedepends=('cmake' 'zlib' 'libaio' 'libxml2' 'openssl' 'pcre' 'lz4')
conflicts=('lib32-libmysqlclient')
source=("https://downloads.mariadb.org/interstitial/connector-c-$pkgver/mariadb-connector-c-$pkgver-src.tar.gz")
sha256sums=('82a5710134e7654b9cad58964d6a25ed91b3dc1804ff51e8be2def0032914089')

build() {
	export CC="gcc -m32"
	export CXX="g++ -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
	cd ${pkgbase}-${pkgver}-src
	cmake ../${pkgbase}-${pkgver}-src \
	-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd ${pkgbase}-${pkgver}-src
	make DESTDIR="${pkgdir}" install
	cd ${pkgdir}/usr
	mkdir lib32
	mv lib/mariadb/* lib32
	rm -rf lib bin
}
