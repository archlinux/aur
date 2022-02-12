# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_pkgname=pil-squasher
pkgname=${_pkgname}-git
pkgver=r3.843950f
pkgrel=2
pkgdesc="Convert split mdt + b%02d files into mbn file"
arch=('x86_64')
url="https://github.com/andersson/pil-squasher"
license=('BSD')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_pkgname}"
	make prefix='/usr'
}

package() {
	cd "${srcdir}/${_pkgname}"
	make prefix='/usr' DESTDIR="${pkgdir}" install
}
