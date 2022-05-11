# Maintainer: Brodi <me@brodi.space>
_pkgname=aretext
pkgname=${_pkgname}
pkgver=0.5.0
pkgrel=1
pkgdesc="[BETA] Minimalist text editor that never slows you down."
arch=("any")
url="https://github.com/aretext/aretext"
license=("GPL3")
makedepends=("go")
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}-git")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("1b6554835937635b5ca530f9e0e8350afc9239cb1ba3866d4b84bf38223b679f")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	go build -o aretext -ldflags="-X 'main.commit=66a5a63cb45b6310db45f183bf2cbace360ee863' -X 'main.version=${pkgver}'" main.go
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 aretext "${pkgdir}/usr/bin/aretext"
}
