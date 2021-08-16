# Maintainer: Andrea Corsini <andrea dot corsini at outlook dot com>
pkgname=devour-git
pkgver=12.r22.3184e2a
pkgrel=1
pkgdesc="Window Manager agnostic swallowing feature for terminal emulators"
arch=('x86_64')
url="https://github.com/salman-abedin/devour"
license=('GPL3')
depends=('libx11')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/salman-abedin/devour.git"
	"devour-shellalias-12.diff") # PR in upstream, so far ignored.
md5sums=('SKIP'
         'a3a3112ba39dd024a139f9ba027d3e5f')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "12.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
        cd "$srcdir/${pkgname%-git}"
        patch --verbose < "$srcdir/devour-shellalias-12.diff"
}

build() {
        cd "$srcdir/${pkgname%-git}"
        make all
}

package() {
        cd "$srcdir/${pkgname%-git}"
        make BIN_DIR="$pkgdir/usr/bin" install
}

