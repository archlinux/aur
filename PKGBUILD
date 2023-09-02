# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Vincent Bidard de la Noë <vincentbidarddelanoe@gmail.com>
pkgname=cpoint-git
pkgver=0.2
pkgrel=1
pkgdesc="C-like programming language compiler based on LLVM with garbage collection"
arch=('any')
url="https://github.com/Vinz2008/C."
license=('GPL')
depends=('llvm-libs' 'clang' 'glibc' 'gcc-libs' 'sh')
makedepends=("git" "llvm")
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
    make -C ${pkgdir}/usr/local/lib/cpoint/std/ clean
    rm -rf ${pkgdir}/home ${pkgdir}/usr/local/lib/cpoint/bdwgc_prefix/lib/*.so* 
}
