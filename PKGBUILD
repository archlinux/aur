# Maintainer: satcom886 <rostik.medved@gmail.com>
# Contributor: bronze <jlbakker@gmail.com>
# Contributor: telsch <telsch@gmx.de>

pkgname=vc4clstdlib-git
pkgver=r66.0ad47e3
pkgrel=4
pkgdesc="VC4CL implementation of the OpenCL standard-library and is required to build the VC4C compiler"
arch=('any')
url="https://github.com/doe300/VC4CLStdLib"
license=('MIT')
groups=()
depends=('khronos-ocl-icd')
makedepends=('git' 'make' 'gcc')
optdepends=()
provides=('vc4clstdlib' 'vc4-libraries')
source=("VC4CLStdLib::git+https://github.com/doe300/VC4CLStdLib")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/VC4CLStdLib"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p "$srcdir/VC4CLStdLib/build"
	cd "$srcdir/VC4CLStdLib/build"
	cmake "$srcdir/VC4CLStdLib"
	make
}

package() {
	cd "$srcdir/VC4CLStdLib/build"
	make DESTDIR="$pkgdir/" install
}
