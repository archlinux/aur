# Contributor: Dylan Wadler <dylan@slant.tech>
# Maintainer: Dylan Wadler <dylan@slant.tech>

pkgname=pcbmodelgen-git
pkgver=v0.2.0.r69.gb60c441
provides=('pcbmodelgen')
pkgdesc="Convert KiCAD PCB files to models for import in openEMS"
pkgrel=1
_last_tagged_version="0.2.0"
arch=('x86_64')
url='https://github.com/jcyrax/pcbmodelgen'
license=('GPL3')
depends=('openems' 'appcsxcad' 'tinyxml2')
makedepends=('git' 'cmake' 'gcc' 'tclap' )
source=(git+"${url}.git#branch=master")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/pcbmodelgen"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/pcbmodelgen"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../
	make -j $(nproc)
}

package() {
	cd "${srcdir}/pcbmodelgen/build"
	make DESTDIR="$pkgdir/" install/strip
}
