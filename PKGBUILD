# Maintainer: Darjan Krijan [disc-kuraudo.eu]

pkgname=libudfread-dk
pkgver=1.1.2.4
pkgrel=1
pkgdesc="libudfread extended with parsing timestamps for disc-kuraudo"
arch=('x86_64' 'aarch64')
license=('LGPL2.1')
url='https://disc-kuraudo.eu'
depends=('glibc')
makedepends=('git')
provides=(
	'libudfread'
	'libudfread.so'
)
conflicts=('libudfread')
source=('libudfread-dk::git+https://github.com/disc-kuraudo/libudfread.git#commit=580808e6614b4a9e5ce6b45d1adfdd1a70a4e563')
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

	mkdir -p "${pkgdir}/usr/share/licenses/libudfread"
	cp "${srcdir}/${pkgname}/COPYING" ${pkgdir}/usr/share/licenses/libudfread/LICENSE
}
