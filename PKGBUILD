# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: glatavento <glatavento at outlook dot com>

pkgname=libjaylink-git
_pkg="${pkgname%-git}"
pkgver=0.3.1.r0.g0d23921
pkgrel=1
pkgdesc='Library for accessing SEGGER J-Link and compatible devices'
arch=('x86_64')
url='https://gitlab.zapb.de/libjaylink/libjaylink'
license=('GPL')
depends=('glibc')
makedepends=('git')
optdepends=('libusb' 'doxygen: Required for API documentation')
provides=("$_pkg.so")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkg"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkg"
	make DESTDIR="$pkgdir/" install
}
