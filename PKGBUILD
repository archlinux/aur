# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="liblogcpp"
pkgver=1.9.3
pkgrel=4
pkgdesc="A intuitive and highly customizable LGPL library for logging with C++."
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
url="https://github.com/nullptrT/liblogcpp.git"
license=('LGPL3')
replaces=('liblogcpp-qt')
provides=('liblogcpp')
conflicts=('liglogcpp-git')
depends=()
makedepends=('cmake')
source=("liblogcpp-v${pkgver}.tar.gz::https://github.com/nullptrT/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('80b7d94af296a4610465bf489308f2844c1ec0214a51bc5f6f9e732851259044ac069359059ccff2c9081d6229ebf0cc8438654e53a905b40ae8414aba38f4a8')



prepare() {
        [[ -e "$srcdir/build" ]] && rm -r "$srcdir/build"
        mkdir "$srcdir/build"
}

build() {
	cd "$srcdir/build"
	
	cmake -DCMAKE_INSTALL_PREFIX:PATH="/usr" \
		-DLOGCPP_SHARED=ON \
		-DLOGCPP_INSTALL_LIBS=ON \
		"../liblogcpp-${pkgver}"
	
	make
}
	
package() {
	cd "$srcdir/build"
	make DESTDIR="${pkgdir}" install
}
