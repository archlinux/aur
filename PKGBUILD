# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="liblogcpp"
pkgver=1.9.0
pkgrel=4
pkgdesc="A intuitive and highly customizable LGPL library for logging with C++."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/nullptrT/liblogcpp.git"
license=('LGPL3')
conflicts=('liblogcpp-qt')
provides=('liblogcpp')
depends=()
makedepends=('cmake' 'git')
source=("git+https://github.com/nullptrT/liblogcpp.git#tag=$pkgver")
sha512sums=('SKIP')



prepare() {
        [[ -e "$srcdir/build" ]] && rm -r "$srcdir/build"
        mkdir "$srcdir/build"
}

build() {
	cd "$srcdir/build"
	
	cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DLOGCPP_SHARED=ON \
		-DLOGCPP_INSTALL_LIBS=ON \
		"../liblogcpp"
	
	make
}
	
package() {
	cd "$srcdir/build"
	make DESTDIR="${pkgdir}" install
}
