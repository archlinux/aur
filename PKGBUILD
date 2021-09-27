# Maintainer: Brodi <me@brodi.space>
_pkgname=aretext
pkgname=${_pkgname}
pkgver=0.2.1
pkgrel=1
pkgdesc="[BETA] Minimalist text editor that never slows you down."
arch=("any")
url="https://github.com/aretext/aretext"
license=("GPL3")
makedepends=("go")
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}-git")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("bce1d38d137f292bc89c1cedda1fcb87dfb4c35a7d3b5116c9128bcf09c64821")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	go build -o aretext -ldflags="-X 'main.commit=69c55ff9715b9454728a148d63fccfbf71bf8833' -X 'main.version=${pkgver}'" main.go
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 aretext "${pkgdir}/usr/bin/aretext"
}
