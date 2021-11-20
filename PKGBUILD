# Maintainer: Brodi <me@brodi.space>
_pkgname=aretext
pkgname=${_pkgname}
pkgver=0.3.0
pkgrel=1
pkgdesc="[BETA] Minimalist text editor that never slows you down."
arch=("any")
url="https://github.com/aretext/aretext"
license=("GPL3")
makedepends=("go")
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}-git")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("5de3eeace5e64cf48d04ea0423c2478bcb234f685e0a724b82d1a1d9c20b8292")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	go build -o aretext -ldflags="-X 'main.commit=b138bfcc15314084bbc805c1670232ba03faa2ec' -X 'main.version=${pkgver}'" main.go
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 aretext "${pkgdir}/usr/bin/aretext"
}
