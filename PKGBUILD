# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=aptivi-adt-git
pkgver=v1.2.0.4.r27.52f17ed
pkgrel=1
pkgdesc="Simulates our future-planned kernel"
arch=('any')
url="https://aptivi.github.io"
license=('MIT')
depends=('python-babel' 'python-gitpython')
makedepends=('git' 'make' 'python-build' 'python-installer' 'python-wheel')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
source=("${pkgname}::git+https://github.com/Aptivi/tools#branch=main")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
	cd "${pkgname}"
	make clean
	git submodule update --init --remote
}

build() {
	cd "${pkgname}"
	make build-noadt
}

package() {
	cd "${pkgname}"
	make install DESTDIR="$pkgdir"
}
