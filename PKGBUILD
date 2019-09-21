# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=vc4c-git
pkgver=1
pkgrel=1
pkgdesc="VC4CL is an implementation of the OpenCL 1.2 standard for the VideoCore IV GPU."
arch=('any')
url="https://github.com/doe300/VC4CL"
license=('MIT')
groups=()
depends=('llvm' 'gcc' 'opencl-headers' 'ocl-icd')
makedepends=('cmake' 'git' 'make')
optdepends=()
provides=('opencl-pi' 'opencl-vc4' 'opencl-driver')
source=("VC4C::git+https://github.com/doe300/VC4C/VC4C.git" "VC4CL::git+https://github.com/doe300/VC4CL/VC4CL.git" "VC4CLStdLib::git+https://github.com/doe300/VC4CLStdLib/VC4CLStdLib.git")
md5sums=('SKIP' 'SKIP' 'SKIP')

build() {
    mkdir -p $srcdir/VC4CL/build
	mkdir -p $srcdir/VC4C/build
	mkdir -p $srcdir/VC4CLStdLib/build
	cd $srcdir/VC4CLStdLib/build
	cmake ..
	make
	cd ../..
    cd VC4C/build
	cmake ..
	make
    cd ../..
    cd VC4CL/build
    cmake ..
    make
    cd ../..
}

package() {
	cd $srcdir/VC4CLStdLib/build
	make DESTDIR="$pkgdir"/ install
	cd $srcdir/VC4C/build
	make DESTDIR="$pkgdir"/ install
    cd $srcdir/VC4CL/build
    make DESTDIR="$pkgdir"/ install
}
