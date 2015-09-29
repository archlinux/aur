# Maintainer: Manuel Mendez <mmendez534@gmail.com>
pkgname=bcc-git
pkgver=v0.1.6.r134.4d97f7f
pkgrel=1
pkgdesc="BPF Compiler Collection"
arch=(x86_64 x86)
url="https://github.com/iovisor/bcc"
license=('Apache')
depends=('python')
makedepends=('git' 'cmake' 'python')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/iovisor/bcc')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

}

build() {
	[[ -d "$srcdir/${pkgname%-git}/build" ]] && rm -rf "$srcdir/${pkgname%-git}/build"
	mkdir "$srcdir/${pkgname%-git}/build"
	cd "$srcdir/${pkgname%-git}/build"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib ..
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build"
	make DESTDIR="$pkgdir/" install
}
