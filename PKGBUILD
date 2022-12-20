# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=clipboard-git
_pkgname="${pkgname%-git}"
pkgver=0.1.3.r166.33585b9
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal (git version)."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'cmake')
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
	cmake -B build -S "${_pkgname}" \
	-DCMAKE_BUILD_TYPE='None' \
	-DCMAKE_INSTALL_PREFIX='/usr' \
	-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
