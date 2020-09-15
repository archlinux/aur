# Maintainer: iniVation AG <support@inivation.com>

pkgname=libcaer
pkgver=3.3.8
pkgrel=1
pkgdesc="Minimal C library to access, configure and get data from neuromorphic sensors and processors."
url="https://gitlab.com/inivation/dv/$pkgname/"
license=('BSD')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('libusb' 'libserialport' 'opencv')
makedepends=('cmake' 'pkgconf')
provides=()
conflicts=()
replaces=()
options=('staticlibs')
source=("https://gitlab.com/inivation/dv/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('57d8b2c1fcf4721088b163a1840332b50883e2f8b028a9b380cc4eae14ddf6ac')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_SERIALDEV=1 -DENABLE_OPENCV=1 -DENABLE_STATIC=1 -DUDEV_INSTALL=1 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install

	cd "$pkgdir"

	# Fix udev directory due to symlinks
	mv lib/udev/ usr/lib/
	rm -Rf lib/
}
