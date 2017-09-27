# Maintainer: Sebastian Lau <lauseb644 _at_ gmail _dot_ com>

pkgname="liblogcpp"
pkgver=1.9.3
pkgrel=2
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
sha512sums=('51394e36772012ac5c8505b07159ccc844393be615cecb0d1404c999f32ff266c1298e49bafe5aa3c32f0799c4a2f672c146e8329e684a650d6ba128498becdc')



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
