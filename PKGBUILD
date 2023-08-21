pkgname=hdrmerge
pkgver=0.6.0
pkgrel=2
pkgdesc='HDRMerge fuses two or more raw images into a single raw with an
extended dynamic range.'
arch=('i686' 'x86_64')
url='http://jcelaya.github.io/hdrmerge/'
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libraw' 'libkexiv2' 'exiv2' 'zlib' 'alglib' 'boost-libs' 'qt5-tools')
provides=('hdrmerge')

source=("$pkgname"::"git+https://github.com/jcelaya/hdrmerge.git#commit=ca38b54f980564942a7f2b014a5f57a64c1d9019" "pr221.patch" "pr222.patch")
md5sums=('SKIP' '60485b0840da444d8aa30c7fe7972aed' 'f577bf85fa9e6fdc5acdcd14df086989')

prepare() {
	cd ${srcdir}/${pkgname}
	patch --forward --strip=1 --input "${srcdir}/pr221.patch"
	patch --forward --strip=1 --input "${srcdir}/pr222.patch"
}

build() {
	cd ${srcdir}/${pkgname}
	cmake CMakeLists.txt -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	make DESTDIR="$pkgdir/" -C ${srcdir}/${pkgname} install
}
