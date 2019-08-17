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
makedepends=('wget' 'gcc' 'cmake' 'llvm')
optdepends=()
provides=('opencl-pi' 'opencl-vc4' 'opencl-driver')
source=("VC4C.tar.gz::https://github.com/doe300/VC4C/archive/master.tar.gz" "VC4CLStdLib.tar.gz::https://github.com/doe300/VC4CLStdLib/archive/master.tar.gz")
md5sums=('SKIP' 'SKIP')

build() {
	mkdir -p $srcdir/VC4C-master/build
	mkdir -p $srcdir/VC4CLStdLib-master/build
	cd $srcdir/VC4CLStdLib-master/build
	cmake "$srcdir/VC4CLStdLib-master"
	make
	cd $srcdir/VC4C-master/build
	cmake -DCMAKE_BUILD_TYPE=Release -DMULTI_THREADED=true "$srcdir/VC4C-master"
	make
}

package() {
	cd $srcdir/VC4CLStdLib-master/build
	make DESTDIR="$pkgdir"/ install
	cd $srcdir/VC4C-master/build
	make DESTDIR="$pkgdir"/ install
}
