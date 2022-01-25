# Maintainer: Brodi <me@brodi.space>
_pkgname=aretext
pkgname=${_pkgname}
pkgver=0.4.0
pkgrel=1
pkgdesc="[BETA] Minimalist text editor that never slows you down."
arch=("any")
url="https://github.com/aretext/aretext"
license=("GPL3")
makedepends=("go")
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}-git")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("4d64e56e327a6ea2e5a4c9f8928e672b3f21b267490f945e0b28bab87cc9189c")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	go build -o aretext -ldflags="-X 'main.commit=37dcec3199a9f08987e4bc1016f9a7fb6c8821d3' -X 'main.version=${pkgver}'" main.go
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 aretext "${pkgdir}/usr/bin/aretext"
}
