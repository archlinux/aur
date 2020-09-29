# Maintainer: x1b6e6 <ftdabcde@gmail.com>

pkgname=aes-git
pkgver=0.2.0.r2.gd311ffd
pkgrel=2
pkgdesc="encryption utility with very simple interface"
arch=('any')
url="https://github.com/x1b6e6/aes"
license=("MIT")
depends=("libgcrypt" "docopt")
makedepends=("gcc" "make" "cmake")
conflicts=("aes")
provides=("aes")

source=("${pkgname%-git}::git+${url}")

sha1sums=("SKIP")

pkgver() {
	cd $srcdir/${pkgname%-git}
	git describe --tags | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g;s/\.rc/rc/'
}

build(){
	cd $srcdir/${pkgname%-git}
	cmake -Bbuild -G "Unix Makefiles"
	cmake --build build --target all
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/${pkgname%-git}/build/aes" "$pkgdir/usr/bin/aes"
}

# vim: set ts=4 sw=4 :
