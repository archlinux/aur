# Maintainer: Andrea Corsini <andrea dot corsini at outlook dot com>
pkgname=devour-git
pkgver=v11.0.r4.0fe8d05
pkgrel=1
pkgdesc="Window Manager agnostic swallowing feature for terminal emulators"
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

prepare() {
        cd "$srcdir/${pkgname%-git}"
        patch < devour-shellalias-10.0.diff
}

build() {
        cd "$srcdir/${pkgname%-git}"
        make all
}

package() {
        cd "$srcdir/${pkgname%-git}"
        make BIN_DIR="$pkgdir/usr/local/bin" install
}
