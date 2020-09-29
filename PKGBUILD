# Maintainer: x1b6e6 <ftdabcde@gmail.com>

pkgname=pnghide-git
pkgver=0.2.3.r3.gb152869
pkgrel=2
pkgdesc="hide plain text in png file inside pixels (unvisible changes)."
url="https://github.com/x1b6e6/pnghide.git"
license=("MIT")
arch=('any')
depends=("libpng" "docopt")
makedepends=("gcc" "make" "cmake" "png++")
optdepends=("aes: for encryping data")
conflicts=("pnghide")
provides=("pnghide")

pkgver() {
	cd $srcdir/${pkgname%-git}
	git describe --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}

source=("git+${url}")

sha1sums=("SKIP")

build(){
	cd $srcdir/${pkgname%-git}
	cmake -Bbuild -G "Unix Makefiles"
	cmake --build build --target all
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/${pkgname%-git}/build/pnghide" "$pkgdir/usr/bin/pnghide"
}

# vim: set ts=4 sw=4 :
