# Maintainer: Vincent Bidard de la Noë <vincentbidarddelanoe@gmail.com>
pkgname=cpoint-git
pkgver=0.3
pkgrel=1
pkgdesc="C-like programming language compiler based on LLVM with garbage collection"
arch=('any')
url="https://github.com/Vinz2008/C."
license=('GPL-3.0-only')
depends=('llvm-libs' 'clang' 'glibc' 'gcc-libs' 'sh' 'gcc' 'make' 'automake')
makedepends=("git" "llvm" "tomlplusplus")
checkdepends=("python" "python-termcolor")
options=('staticlibs')
provides=()
install=
source=("cpoint::git+https://github.com/Vinz2008/C.")
noextract=()
sha256sums=('SKIP')

prepare(){
    cd ${srcdir}/cpoint
	git submodule init
    git submodule update
}

build() {
	cd ${srcdir}/cpoint
	make release
}

check() {
	cd ${srcdir}/cpoint
	make test
#    make std-test
}

package() {
	cd ${srcdir}/cpoint
    mkdir -p ${pkgdir}/usr/bin
    mkdir -p ${pkgdir}/usr/local/{,lib,bin}
	make DESTDIR="$pkgdir/" PREFIX="$pkgdir/usr/local" install
    rm -rf ${pkgdir}/home ${pkgdir}/usr/local/lib/cpoint/bdwgc_prefix/lib/*.so* 
}
