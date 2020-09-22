# Maintainer: Westly Ward <sonicrules1234 at gmail dot com>
pkgname=gcc81-raspi4-xmrig
pkgver=8.1.0
pkgrel=2
epoch=
pkgdesc="This package is meant to be a dependency for xmrig-raspi4-donateless because it will not compile with gcc 10.  It only includes C and C++"
arch=('aarch64')
url=""
license=('GPL3')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!buildflags staticlibs !strip)
install=
changelog=
source=("https://ftpmirror.gnu.org/gcc/gcc-8.1.0/gcc-8.1.0.tar.gz"
		"fix.patch")
noextract=()
md5sums=('6a1fabd167fe98c11857181c210fc743'
         'c6fe49a2334ccd59635694a1655d3a09')
validpgpkeys=()

prepare() {
	cd "gcc-8.1.0"
	./contrib/download_prerequisites
	patch --strip=1 --input="../avoid_ustat.patch"
	cd "../"
	mkdir -p build
}

build() {
	cd "build"
	../gcc-8.1.0/configure -v --enable-languages=c,c++ --prefix=/usr/local/gcc-8.1.0 --with-program-suffix=8.1.0 --with-arch=armv8-a --enable-fix-cortex-a53-835769 --enable-fix-cortex-a53-843419 --build=aarch64-unknown-linux-gnu --host=aarch64-unknown-linux-gnu --target=aarch64-unknown-linux-gnu --disable-multilib --disable-werror
	make -j 4
}

package() {
	cd "build"
	make DESTDIR="$pkgdir/" install-strip
}
