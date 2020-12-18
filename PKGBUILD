# Maintainer: Mattia Biondi <mattia biondi1 at gmail dot com>

pkgname=deber-git
_pkgname=${pkgname%-git}
pkgver=v1.1.0.r0.g48bd02c
pkgrel=1
pkgdesc="Debian packaging with Docker"
arch=('x86_64')
url="https://github.com/dawidd6/deber"
license=("MIT")
depends=('docker')
makedepends=('git' 'go')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	go build \
		-buildmode=pie \
		-o ${_pkgname}
}

package() {
	cd "${srcdir}/${pkgname}"

	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}


