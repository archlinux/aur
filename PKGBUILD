# Maintainer: Westly Ward <sonicrules1234 at gmail dot com>
pkgname=gcc81-raspi4-xmrig
pkgver=8.1.0
pkgrel=1
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
options=(!buildflags)
install=
changelog=
source=("https://ftpmirror.gnu.org/gcc/gcc-8.1.0/gcc-8.1.0.tar.gz"
		"fix.patch")
noextract=()
md5sums=('6a1fabd167fe98c11857181c210fc743'
         'a0bb00114182d8095e0eb255ddf0c767')
validpgpkeys=()

prepare() {
	cd "gcc-8.1.0"
	./contrib/download_prerequisites
	#mv gcc-8.1.0 gcc-8.1.0.orig
	#cp -r gcc-8.1.0.orig gcc-8.1.0.new
	#cd gcc-8.1.0.new
	patch --strip=1 --input="../fix.patch"
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
