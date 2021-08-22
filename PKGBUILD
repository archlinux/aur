# Maintainer: Brodi <me@brodi.space>
_pkgname=aretext
pkgname=${_pkgname}
pkgver=0.2.0
pkgrel=1
pkgdesc="[BETA] Minimalist text editor that never slows you down."
arch=("any")
url="https://github.com/aretext/aretext"
license=("GPL3")
makedepends=("go")
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}-git")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("9208aed94fbac9b0840847bbad6bec781f7880323382c6a2f2de785e6fe7da66")

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	go build -o aretext -ldflags="-X 'main.commit=b7ab34fe599930c35ff806efa199b6b9ea3725de' -X 'main.version=${pkgver}'" main.go
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
	install -Dm755 aretext "${pkgdir}/usr/bin/aretext"
}
