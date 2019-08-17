# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=vc4c-git
pkgver=1
pkgrel=1
pkgdesc="Compiler for the VC4CL OpenCL-implementation"
arch=('any')
url="https://github.com/doe300/VC4C"
license=('MIT')
groups=()
depends=()
makedepends=('wget' 'gcc' 'cmake' 'llvm' 'vc4clstdlib-git')
optdepends=()
provides=('opencl-pi' 'opencl-vc4' 'opencl-driver')
source=("https://github.com/doe300/VC4C/archive/master.tar.gz")
md5sums=('SKIP')
_reponame=VC4C

build() {
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=Release -DMULTI_THREADED=true -DVC4CL_STDLIB_DIR=/usr/include/vc4clstdlib-git/include "$srcdir/$_reponame-master"
	make
}

package() {
	cd $srcdir/build
	make DESTDIR="$pkgdir"/ install
}
