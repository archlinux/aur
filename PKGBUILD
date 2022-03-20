# Maintainer: xfnw <xfnw@riseup.net>

pkgname=justify-git
pkgver=r9.0d397c2
pkgrel=1
pkgdesc="Simple text alignment tool that supports left/right/center/fill justify alignment"
arch=('x86_64')
url="https://tildegit.org/jns/justify/"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://tildegit.org/jns/justify.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B "$srcdir/build" -S "$srcdir/${pkgname%-git}"
	cmake --build "$srcdir/build"
}

package() {
	install -D "$srcdir/build/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
