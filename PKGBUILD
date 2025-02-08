# Maintainer: Tad DeVries <me at tad dot xyz>

pkgname=libgpiod-1.6
pkgver=1.6.5
pkgrel=1
pkgdesc="C library and tools for interacting with the linux GPIO character device"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/"
license=('LGPL-2.1-or-later')
depends=('glibc' 'gcc-libs')
optdepends=('pyton: for library bindings')
makedepends=('autoconf-archive' 'doxygen' 'help2man' 'python-setuptools')
conflicts=('libgpiod')
source=("$url/snapshot/libgpiod-$pkgver.tar.gz")
sha256sums=('1473d3035b506065393a4569763cf6b5c98e59c8f865326374ebadffa2578f3a')

build() {
	cd "$srcdir/libgpiod-$pkgver"
	./autogen.sh \
		--prefix=/usr \
	    --enable-tools=yes \
	    --enable-bindings-cxx \
	    --enable-bindings-python
	make
}

package() {
	cd "$srcdir/libgpiod-$pkgver"
	make DESTDIR="$pkgdir/" install
}
