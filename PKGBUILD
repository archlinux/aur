# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="liblogcpp-qt"
pkgver=1.9.0
pkgrel=5
pkgdesc="A intuitive and highly customizable LGPL library for logging with C++. (with support for QString)"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/nullptrT/liblogcpp.git"
license=('LGPL3')
conflicts=('liblogcpp')
provides=('liblogcpp')
depends=('qt5-base')
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
		-DLOGCPP_ENABLE_QT_SUPPORT=ON \
		-DLOGCPP_INSTALL_LIBS=ON \
		"../liblogcpp"
	
	make
}
	
package() {
	cd "$srcdir/build"
	make DESTDIR="${pkgdir}" install
}
