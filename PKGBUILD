# Maintainer: satcom886 <rostik.medved@gmail.com>

pkgname=vc4c-git
pkgver=r683.f986061
pkgrel=3
pkgdesc="Compiler for the VC4CL OpenCL-implementation"
arch=('any')
url="https://github.com/doe300/VC4C"
license=('MIT')
groups=()
depends=('vc4clstdlib-git' 'clang' 'clinfo' 'ocl-icd')
makedepends=('wget' 'gcc' 'cmake' 'llvm' 'opencl-headers')
optdepends=()
provides=('vc4c' 'vc4-compiler' 'opencl-compiler')
source=("VC4C::git+https://github.com/doe300/VC4C")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/VC4C"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p $srcdir/VC4C/build
	cd $srcdir/VC4C/build
	cmake "$srcdir/VC4C" -DCMAKE_BUILD_TYPE=Release -DMULTI_THREADED=true -DCLANG_FOUND=/usr/bin/clang -DVC4CL_STDLIB_DIR=/usr/local/include/vc4cl-stdlib
	make
}

package() {
	cd $srcdir/VC4C/build
	make DESTDIR="$pkgdir"/ install
}
