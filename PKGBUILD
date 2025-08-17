# Maintainer: Toad King <toadking@toadking.com>
# Contributor: spider-mario <spidermario@free.fr>
pkgname=sacd-extract
pkgver=0.3.9.3
pkgrel=2
pkgdesc="Extract DSD files from an SACD image"
arch=('i686' 'x86_64')
url="https://sacd-ripper.github.io/"
license=('GPL2')
depends=('glibc')
makedepends=('cmake' 'git')
source=("git+https://github.com/sacd-ripper/sacd-ripper.git#tag=${pkgver}")
b2sums=('005d101bf9bb4a0c55f718a83727a781cbe8f0b2fc3e76e8129c9d9e8e1d23d32fb38243e2643d0bc2770d61a21522e39a094d76e7e229c2414fa5b514bd70e9')

prepare() {
	cd sacd-ripper/tools/sacd_extract

	# Patch minimum required CMake version to be compatible with current CMake
	sed -i 's/cmake_minimum_required(VERSION 2.6)/cmake_minimum_required(VERSION 3.5)/' CMakeLists.txt
}

build() {
	cd sacd-ripper
	rm -fr build
	mkdir build
	cd build

	CFLAGS=-Wno-incompatible-pointer-types cmake ../tools/sacd_extract/

	make
}

package() {
	cd sacd-ripper/build

	install -Dm755 sacd_extract "$pkgdir"/usr/bin/sacd_extract
}
