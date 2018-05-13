# Maintainer: Shenghao Yang <me@shenghaoyang.info>
pkgname=libe131-git
pkgver=1.3.1.r4.g9e0d1fc
pkgrel=1
pkgdesc="A lightweight C/C++ library for the E1.31 (sACN) protocol"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/hhromic/libe131'
license=('Apache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	autoreconf --install --force
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}