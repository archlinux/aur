# Maintainer: Oscar Shrimpton <oscar.shrimpton.personal@gmail.com>,
pkgname=sleuthkit-java
pkgver=4.10.0
pkgrel=1
pkgdesc='Java bindings for The Sleuth Kit.'
arch=(x86_64)
url='http://www.sleuthkit.org/sleuthkit'
license=('CPL', 'custom:"IBM Public Licence"', 'GPL2')
depends=(java-environment=8 java8-openjfx sleuthkit)
makedepends=(ant)
source=("https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-${pkgver}/sleuthkit-${pkgver}.tar.gz" "build-tmp-dir.patch")
md5sums=('f89ab5442694dfc346301e0b87a16ff3'
         '8a39286ec6585c5298073043af3b4dcf')

prepare() {
	patch "sleuthkit-${pkgver}/bindings/java/build.xml" build-tmp-dir.patch
}

build() {
	cd "sleuthkit-${pkgver}"
	
	# build main program
	./configure
	make

	# build java bindings
	cd bindings/java
	ant
}

package() {
	# copy to package
	mkdir -p $pkgdir/usr/share/java/
	cp "sleuthkit-${pkgver}/bindings/java/dist/sleuthkit-${pkgver}.jar" $pkgdir/usr/share/java
}
