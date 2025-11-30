# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=anarch
pkgname="${_pkgname}-git"
pkgver=1.0.r127
pkgrel=1
pkgdesc='Anarch, the suckless FPS game'
arch=('x86_64' 'aarch64')
url="https://gitlab.com/drummyfish/anarch.git"
license=('CC0')
makedepends=('git')
depends=('sdl2')
source=("git+${url}")
sha256sums=('SKIP')
conflicts=("${_pkgname}" "${_pkgname}-bin" )

pkgver() {
	cd "${_pkgname}"
	git describe --long --abbrev=7 --tags | sed 's/\([^-]*\)-g.*/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	./make.sh sdl
}

package() {
	cd "${_pkgname}"
	install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname^}/LICENSE"
}
