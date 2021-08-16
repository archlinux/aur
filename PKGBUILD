# Maintainer: Tim Paik <timpaik@163.com>
pkgname=txikijs-git
pkgver=r406.0a53344
pkgver() {
	cd "${pkgname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}
pkgrel=1
pkgdesc="The tiny JavaScript runtime built with QuickJS, libuv and heart"
arch=('x86_64')
url="https://github.com/saghul/txiki.js"
license=('MIT')
depends=('curl')
makedepends=('git' 'cmake')
source=("${pkgname}::git+https://github.com/saghul/txiki.js.git")
sha256sums=('SKIP')
prepare() {
	cd "${srcdir}/${pkgname}"
	git submodule update --init
}
build() {
	cd "${srcdir}/${pkgname}"
	make
}
package() {
	install -D ${srcdir}/${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D ${srcdir}/${pkgname}/build/tjs ${pkgdir}/usr/bin/tjs
}
