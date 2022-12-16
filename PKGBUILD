# Maintainer: Darjan Krijan [disc-kuraudo.eu]

pkgname=libudfread-dk
pkgver=1.1.2.3
pkgrel=1
pkgdesc="libudfread extended with parsing timestamps for disc-kuraudo"
arch=('x86_64')
license=('LGPL2.1')
url='disc-kuraudo.eu'
depends=('glibc')
makedepends=('git')
provides=(
	'libudfread'
	'libudfread.so'
)
conflicts=('libudfread')
source=('git+https://github.com/disc-kuraudo/libudfread.git')
sha256sums=('SKIP')

prepare() {
	mkdir -p build

	cd libudfread
	./bootstrap
}

build() {
	cd build
	../libudfread/configure \
		--prefix=/usr \
		--disable-static

	make
}

package() {
	make -C build DESTDIR="${pkgdir}" install
}
