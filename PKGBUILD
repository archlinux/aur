# Maintainer: Darjan Krijan [disc-kuraudo.eu]

pkgname=libudfread-dk
pkgver=1.1.2.3.g1ee0ef9
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
source=('libudfread-dk::git+https://github.com/disc-kuraudo/libudfread.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(git describe --long --tags | tr - .)"
}

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
