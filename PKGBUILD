# Maintainer: Michael Koloberdin <michael@koloberdin.com>
pkgname=odcread-git
pkgver=0.2.r5.g9c09cc9
pkgrel=2
pkgdesc="Reader/converter for 'Oberon compound document' binary format used by the Black Box Component Builder"
arch=('x86_64')
url="https://github.com/ComdivByZero/${pkgname%-git}"
license=('GPL')
depends=()
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/ComdivByZero/${pkgname%-git}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cmake -B build -S "$srcdir/${pkgname%-git}" \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCMAKE_INSTALL_PREFIX='/usr'
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
