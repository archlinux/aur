# Maintainer: Andrea Corsini <andrea dot corsini at outlook dot com>
pkgname=devour-git
pkgver=v10.r29.9435066
pkgrel=1
pkgdesc="Window Manager agnostic swallowing feature for terminal emulator"
arch=('x86_64')
url="https://github.com/salman-abedin/devour"
license=('GPL3')
depends=('libx11')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/salman-abedin/devour.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --tag | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make PREFIX=/usr
} 

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" PREFIX=/usr install
}
