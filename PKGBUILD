# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=lstune-git
pkgver=r6.849dc19
pkgrel=1
pkgdesc="LS Tune strobe tuner"
arch=('x86_64')
url="https://github.com/craigeaton/lstune"
license=('GPL')
depends=('qt5-multimedia')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/craigeaton/lstune')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/qt"
	qmake
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/qt"
	install -D lstune "$pkgdir/usr/bin/lstune"
}
