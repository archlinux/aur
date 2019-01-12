# Maintainer: Adrian Wersching <dev@awersching.com>

_pkgname=wedder
pkgname="${_pkgname}-git"
pkgdesc="Current weather info for status bars like polybar"

pkgver=1.0.0.r0.gf9daaf7
pkgrel=1
arch=("any")

url="www.github.com/awersching/wedder"
source=("git+https://github.com/awersching/wedder.git")
license=("MIT")

makedepends=("git" "rust")
md5sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	git describe  --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"

	install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
