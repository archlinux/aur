# Maintainer:  <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=2048.cpp
pkgname=${_pkgname}-git
pkgver=r362.50bd8a7
pkgrel=2
pkgdesc="Fully featured terminal version of the game "2048" written in C++ "
arch=('any')
url="https://github.com/plibither8/2048.cpp"
license=('MIT')
makedepends=('git' 'cmake')
source=("git+https://github.com/plibither8/2048.cpp.git")
sha1sums=('SKIP')

conflicts=("2048.c" "2048.c-git" "2048-cli-git" "2048-curses" "2048-rs")

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake .
	cmake --build .
}

package() {
	install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install "${srcdir}/${_pkgname}/2048" -D "${pkgdir}/usr/bin/2048"
}
