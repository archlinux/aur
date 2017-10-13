# Maintainer: Geoffrey Frogeye <geoffrey@frogeye.fr>
pkgname=mercpcl-git
pkgver=r9.ce3d815
pkgrel=1
pkgdesc="Command Line Mercury FPGA Programmer"
arch=('i686' 'x86_64')
url="https://github.com/cr1901/mercpcl"
license=('GPL3')
depends=('libftdi-compat' 'libusb')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('mercpcl::git+https://github.com/cr1901/mercpcl.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	mkdir -p "$srcdir/${pkgname%-git}/build"
	cd "$srcdir/${pkgname%-git}/build"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
