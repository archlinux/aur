# Maintainer: iniVation AG <support@inivation.com>

pkgname=libcaer
pkgver=3.3.15
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
source=("https://release.inivation.com/libcaer/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=('ced97ffd49053ba0722c362c81a675ff96f9d1c17cfb848a2e37ace3d2ff35f7')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_SERIALDEV=1 -DENABLE_OPENCV=1 -DENABLE_STATIC=1 -DUDEV_INSTALL=1 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
