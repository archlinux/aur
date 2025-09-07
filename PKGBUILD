pkgname=hdrmerge
pkgver=0.6.0
pkgrel=5
pkgdesc='HDRMerge fuses two or more raw images into a single raw with an
extended dynamic range.'
arch=('i686' 'x86_64')
url='http://jcelaya.github.io/hdrmerge/'
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libraw' 'libkexiv2' 'exiv2' 'zlib' 'alglib' 'boost-libs' 'qt5-tools')
provides=('hdrmerge')

source=("$pkgname"::"git+https://github.com/jcelaya/hdrmerge.git#commit=e2a46f97498b321b232cc7f145461212677200f1")
md5sums=('SKIP')

prepare() {
	cd ${srcdir}/${pkgname}
}

build() {
	cd ${srcdir}/${pkgname}
	cmake CMakeLists.txt -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
	make
}

package() {
	make DESTDIR="$pkgdir/" -C ${srcdir}/${pkgname} install
}
