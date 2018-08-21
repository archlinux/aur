# Maintainer: Danilo Pianini

pkgname=opencorsairlink-testing-git
pkgver=20180819
pkgrel=1
pkgdesc="Linux® support for Corsair H100i and other water coolers of the same brand. Testing branch, more feature rich, less stable."
arch=('x86_64')
url="https://github.com/audiohacked/OpenCorsairLink"
license=('GPL')
depends=(libusb)
makedepends=(git libdrm pkg-config)
source=(git+https://github.com/audiohacked/OpenCorsairLink#branch=testing)
md5sums=(SKIP)
conflicts=()
provides=(opencorsairlink=$pkgver)

pkgver() {
	cd $srcdir/OpenCorsairLink
	git log -1 --date=short --format=%cd | tr -d \-
}

build() {
	cd $srcdir/OpenCorsairLink
	echo $LDFLAGS
	export LDFLAGS="$LDFLAGS -lm"
	echo $LDFLAGS
	make
}

package() {
	install -D $srcdir/OpenCorsairLink/OpenCorsairLink.elf $pkgdir/usr/bin/OpenCorsairLink
}
