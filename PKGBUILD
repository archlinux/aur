# Maintainer: Erik Bročko (OM2LT) <erik@brocko.eu>
pkgname=soapymiri-git
pkgver=r24.1ef1b42
pkgrel=1
pkgdesc="SoapySDR module for libmirisdr"
arch=('any')
url="https://github.com/ericek111/SoapyMiri"
license=('GPL3')
depends=('soapysdr' 'libmirisdr5')
makedepends=('git' 'cmake')
source=("$pkgname"::"git+https://github.com/ericek111/SoapyMiri")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "$srcdir/$pkgname" -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
