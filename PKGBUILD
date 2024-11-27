# Maintainer: Grafcube <grafcube at disroot dot org>

_pkgname=namedicon
pkgname=${_pkgname}-git
pkgver=1.1.0.r0.g8a405a5
pkgrel=1
pkgdesc='Get system icons from the name using the default icon theme. '
arch=('x86_64')
url="https://codeberg.org/grafcube/${_pkgname}"
license=('GPL')
depends=('gtk3')
makedepends=('git' 'zig')
provides=($_pkgname)
conflicts=($_pkgname)
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	zig build --release=safe
}

package() {
	cd "${pkgname}"
	install -Dm755 zig-out/bin/${_pkgname} "$pkgdir"/usr/bin/${_pkgname}
}
