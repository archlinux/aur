# Maintainer: Russell Greene <russellgreene8 at gmail dot com>

pkgname=chigraph
pkgver=1.0.0a
pkgrel=1
arch=('i686' 'x86_64')

pkgdesc="A visual programming language"
url='https://github.com/chigraph/chigraph'

conflicts=("chigraph-git")

depends=('libgit2' 'llvm-libs' 'lldb' 'clang' 'boost-libs')
makedepends=('cmake' 'boost' 'llvm' 'tar' 'coreutils' 'gzip')

source=("https://github.com/chigraph/chigraph/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
	tar xf v${pkgver}.tar.gz
	mkdir -p build
}

build() {
	cd build
	cmake ../chigraph-${pkgver} -DCMAKE_BUILD_TYPE=Release -DCG_USE_SYSTEM_LIBGIT2=ON -DCG_USE_SYSTEM_BOOST=ON -DCG_BUILD_TESTS=OFF -DCMAKE_INSTALL_PREFIX=/usr
	make -j`nproc`
}

package() {
	make -C build DESTDIR="${pkgdir}" install
}
