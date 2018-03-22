# Maintainer: Dasith Gunawardhana <dasith.gunawardhana@gmail.com>

_pkgname=copac
pkgname=${_pkgname}-git
pkgver=r7.58838f2
pkgrel=1
pkgdesc="An AUR helper"
arch=('x86_64')
url="https://gitlab.com/dasith.gunawardhana/copac.git"
license=('GPL3')
depends=('pacman' 'libgit2' 'curl')
makedepends=('git' 'nlohmann-json')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://gitlab.com/dasith.gunawardhana/copac.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
