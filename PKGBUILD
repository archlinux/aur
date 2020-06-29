# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=vc4cl-git
pkgver=1
pkgrel=3
pkgdesc="VC4CL is an implementation of the OpenCL 1.2 standard for the VideoCore IV GPU."
arch=('any')
url="https://github.com/doe300/VC4CL"
license=('MIT')
groups=()
depends=('llvm' 'clinfo' 'ocl-icd' 'vc4c-git')
makedepends=('make' 'wget' 'gcc' 'cmake' 'clang' 'opencl-headers')
optdepends=()
provides=('opencl-pi' 'opencl-vc4' 'opencl-driver' 'vc4-opencl' 'vc4cl')
source=("VC4CL.tar.gz::https://github.com/doe300/VC4CL/archive/master.tar.gz")
md5sums=('SKIP')

build() {
    mkdir -p $srcdir/VC4CL-master/build
	cd $srcdir/VC4CL-master/build
	cmake "$srcdir/VC4CL-master" -DCMAKE_BUILD_TYPE=Release -DMULTI_THREADED=true -DCLANG_FOUND=/usr/bin/clang -DVC4CL_STDLIB_DIR=/usr/local/include/vc4cl-stdlib
	make
}

package() {
    cd $srcdir/VC4CL-master/build
    make DESTDIR="$pkgdir"/ install
}
