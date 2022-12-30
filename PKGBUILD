# Maintainer: Giorgi Kobakhidze <gk@koba.pvt.ge>

_pkgname=libsignal-protocol-javascript
pkgname="${_pkgname}-git"
pkgver=1.3.0.r5.g4fbea5a
pkgrel=1
license=(GPL3)
arch=(any)
url="https://github.com/signalapp/${_pkgname}"
makedepends=(emscripten npm grunt-cli)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd -- "${_pkgname}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd -- "${_pkgname}"
	npm install
	grunt build
}

package() {
	cd -- "${_pkgname}"
	install -dm755 "$pkgdir"/usr/share/webapps/"${_pkgname}"
	cp -R dist "$pkgdir"/usr/share/webapps/"${_pkgname}"/
}
