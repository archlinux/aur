# Maintainer: Adrian Wersching <dev@awersching.com>

_pkgname=wedder
pkgname="${_pkgname}-git"
pkgdesc="Current weather info for status bars like polybar"

pkgver=1.0.6.r0.g5842573
pkgrel=1
arch=("any")

url="https://github.com/awersching/wedder"
source=("git+https://github.com/awersching/wedder.git")
license=("MIT")

makedepends=("git" "rust")
conflicts=("wedder")
md5sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	git describe  --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	make build
}

package() {
	cd "${_pkgname}"

	install -Dm755 target/release/$_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 examples/wedder.toml "${pkgdir}/etc/${_pkgname}/wedder.toml"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
