# Maintainer: Darjan Krijan [disc-kuraudo.eu]

pkgname=libudfread-dk
pkgver=1.1.2.3
pkgrel=1
pkgdesc="libudfread extended with parsing timestamps for disc-kuraudo"
arch=('x86_64')
license=('LGPL2.1')
url='https://disc-kuraudo.eu'
depends=('glibc')
makedepends=('git')
provides=(
	'libudfread'
	'libudfread.so'
)
conflicts=('libudfread')
source=('libudfread-dk::git+https://github.com/disc-kuraudo/libudfread.git#commit=e90aac368ee4eafd877facae33becbf1cf3a068b')
sha256sums=('SKIP')

prepare() {
	mkdir -p build

	cd "${srcdir}/${pkgname}"
	./bootstrap
}

build() {
	cd build
	../${pkgname}/configure \
		--prefix=/usr \
		--disable-static

	make
}

package() {
	make -C build DESTDIR="${pkgdir}" install
}
