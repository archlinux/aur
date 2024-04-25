# Maintainer: Jordan Rudess <jrudess@gmail.com>
pkgname=slang-verilog
pkgver=6.0
pkgrel=1
epoch=
pkgdesc="SystemVerilog Language Services"
arch=('x86_64')
url="https://github.com/MikePopoloski/slang"
license=('MIT')
groups=()
depends=('fmt' 'catch2' 'boost')
makedepends=('python' 'cmake' 'gcc' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/MikePopoloski/slang/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('c4c43f4ef7e2dcaca15541442f9e75ce8749eb0a16224b7c1a6a3c42ae468179')
validpgpkeys=()

prepare() {
	mkdir -p "$srcdir/slang-$pkgver/build"
}

build() {
	cd "$srcdir/slang-$pkgver/build"
	cmake -DCMAKE_CXX_COMPILER=g++ -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=True -DSLANG_USE_MIMALLOC=False ..
	make VERBOSE=1
}

check() {
	cd "$srcdir/slang-$pkgver/build"
	ctest
}

package() {
	cd "$srcdir/slang-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
