# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="liblogcpp"
pkgver=1.9.0
pkgrel=2
pkgdesc="A intuitive and highly customizable LGPL library for logging with C++."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/nullptrT/liblogcpp.git"
license=('LGPL3')
conflicts=('liblogcpp')
provides=('liblogcpp=${pkgver}')
replaces=('liblogcpp')
depends=()
makedepends=('cmake')
source=("liblogcpp-v${pkgver}.tar.gz::https://github.com/nullptrT/liblogcpp/archive/${pkgver}.tar.gz")
sha512=('')



prepare() {
        [[ -e "$srcdir/build" ]] && rm -r "$srcdir/build"
        mkdir "$srcdir/build"
}

build() {
	cd "$srcdir/build"
	
	cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DLOGCPP_SHARED=ON \
		-DLOGCPP_INSTALL_LIBS=ON \
		"../liblogcpp-$pkgver"
	
	make
}
	
package() {
	cd "$srcdir/build"
	make DESTDIR="${pkgdir}" install
}

md5sums=('e835e62cf93b8d97638e2d34c976aab7')
