# Maintainer: Sebastian Lau <arch _at_ slau _dot_ info>
pkgname="liblogcpp"
pkgver=1.7.2
pkgrel=2
pkgdesc="A simple, intuitive and highly customizable LGPL library for logging with C++."
arch=('x86_64' 'i386' 'armv6h' 'armv7h')
url="https://github.com/nullptrT/liblogcpp"
license=('LGPL2.1')
depends=()
makedepends=('cmake' 'qt5-base')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nullptrT/$pkgname/archive/$pkgver.tar.gz")
md5sums=('3d0ed55d9b8cab23e81b11c0b1140e3f')


prepare() {
	cd "$srcdir"
	[[ -e build ]] && rm -r build
	mkdir build
}

build() {
	cd "$srcdir/build"
	
	cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DLOGCPP_INSTALL_LIBS=ON \
		-DLOGCPP_ENABLE_QT_SUPPORT=ON \
		"../liblogcpp-$pkgver"
	
	make
}
	
package() {
	cd "$srcdir/build"
	make DESTDIR="${pkgdir}" install
}

