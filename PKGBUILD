# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=OpenMRac
pkgname="${_pkgname,,}-git"
pkgver=r14.9676e0a
pkgrel=2
pkgdesc='OpenMRac, a split-screen racing game'
arch=('x86_64' 'aarch64')
url="https://github.com/Franticware/${_pkgname}"
license=('BSD')
makedepends=('git' 'sox')
depends=('openmrac-data-git' 'sdl' 'sdl_image' 'openal')
source=("git+${url}.git")
sha256sums=('SKIP')
conflicts=(${_pkgname})

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}/src"
  mv Makefile.linux Makefile
}

build() {
	cd "${_pkgname}/src"
	make
}

package() {
	cd "${_pkgname}/src"
  install -Dm755 ${_pkgname,,} "${pkgdir}/usr/bin/${_pkgname,,}"
  install -Dm644 ${_pkgname,,}.ico "${pkgdir}/usr/share/pixmaps/${_pkgname,,}.ico"
  install -Dm644 ${_pkgname,,}.desktop "${pkgdir}/usr/share/applications/${_pkgname,,}.desktop"
  install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname,,}/LICENSE"
}
