# Maintainer: Jason Kercher <jkercher43 at gmail>
pkgname=fql
pkgver=1.0
pkgrel=1
#epoch=
pkgdesc="A SQL interpreter for text processing"
arch=(x86_64)  # It is only tested on x86_64
url="https://github.com/jasonKercher/fql"
license=(MIT)
groups=()
depends=(antlr4-runtime pcre libcsv)
makedepends=()
checkdepends=(check)
optdepends=()
provides=(libfql.so)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/jasonKercher/fql/releases/download/1.0/fql-1.0.tar.gz")
noextract=()
md5sums=(a729c32296eca30d00c0a00cd8b90a7b)
validpgpkeys=()

prepare() {
	true
}

build() {
	cd "$pkgname-$pkgver"
	local prefix=$(pacman -Ql antlr4-runtime | head -1 | cut -d' ' -f2)
	export ANTLR4_CPATH=${prefix}/include
	echo "ANTLR4 headers found in ${ANTLR4_CPATH}"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	sudo make install
}
