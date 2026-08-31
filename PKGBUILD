# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=lqqyt2423
_pkgname=go-mitmproxy
pkgname=${_pkgname}
pkgdesc="Golang implementation of mitmproxy that supports man-in-the-middle attacks and parsing, monitoring, and tampering with HTTP/HTTPS traffic"

pkgver=1.9.3
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('x86_64' 'i386' 'arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

makedepends=('go')
depends=('glibc')

provides=("${_pkgname}")
conflicts=("${_pkgname}"{-bin,-git})

source=("${pkgname}-${pkgver}.tgz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e251e55c9b48d38ad04841ff864249d57c8d5eb68ccd922a17a425289998fa41')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}/ || exit 1

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
