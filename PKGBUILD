# Maintainer: Russell Greene <russellgreene8 at gmail dot com>

pkgname=chigraph-git
pkgver=244c0d0a512158d6f126713fc0ca0e2a3b532989
pkgrel=2
arch=('i686' 'x86_64')

pkgdesc="A visual programming language"
url='https://github.com/chigraph/chigraph'

conflicts=("chigraph")

depends=('libgit2' 'llvm-libs' 'lldb' 'boost-libs')
makedepends=('cmake' 'boost' 'llvm' 'clang')

source=("chigraph::git+https://github.com/chigraph/chigraph")
md5sums=('SKIP')

pkgver() {
	cd chigraph
	git rev-parse HEAD
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../chigraph -DCMAKE_BUILD_TYPE=Release -DCG_USE_SYSTEM_LIBGIT2=ON -DCG_USE_SYSTEM_BOOST=ON -DCG_BUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=/usr
	make -j`nproc`
}

package() {
	make -C build DESTDIR="${pkgdir}" install
}
