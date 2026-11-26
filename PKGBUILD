# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=aptivi-adt
pkgver=1.3.0.0
pkgrel=1
pkgdesc="Simulates our future-planned kernel"
arch=('any')
url="https://aptivi.github.io"
license=('MIT')
depends=('python-babel' 'python-gitpython')
makedepends=('git' 'make' 'python-build' 'python-installer' 'python-wheel')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
options=('!strip')
source=("${pkgname}::git+https://github.com/Aptivi/tools#tag=v1.3.0.0")
sha256sums=('SKIP')

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
