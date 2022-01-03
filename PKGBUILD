# Maintainer: Ranadeep B < mail at rnbguy dot at >

_orgname=cosmos
_basename=lens
_pkgname=${_orgname}-${_basename}
pkgname=${_pkgname}-git
pkgver=8c65bf5
pkgrel=1
pkgdesc="Lens for Cosmos ecosystem"
arch=('x86_64')
url="https://github.com/strangelove-ventures/${_basename}"
license=('Apache')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=(
	'go'
	'make'
)
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --always --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make build
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -DT "build/${_basename}" "${pkgdir}/usr/local/bin/${_pkgname}"
	install -m644 -Dt "${pkgdir}/usr/share/licenses/${_pkgname}" LICENSE
}
