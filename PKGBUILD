# Contributor: giga300 <giga300[at]protonmail[dot]com>
# Maintainer: giga300 <giga300[at]protonmail[dot]com>

pkgname=xci2nsp-git
_pkgname=dedbae
pkgver=1.0.0.1.r1.g87b08da
pkgrel=1
pkgdesc='XCI to NSP converter'
arch=('any')
url="https://gitlab.com/roothorick/dedbae"
license=('ISC')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/roothorick/dedbae.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_pkgname}"
	git submodule update --init
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm755 "$srcdir/${_pkgname}/bin/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
}
