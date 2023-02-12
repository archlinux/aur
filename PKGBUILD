# Maintainer: <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Dylan Turner dylantdmt@gmail.com

_pkgname="tetris-cli"
pkgname=${_pkgname}-git
pkgver=r39.06e2e72
pkgrel=2
pkgdesc="A tetris game that runs in a terminal"
arch=('any')
url="https://www.github.com/blueOkiris/tetris-cli"
license=('GPL3')
makedepends=('git' 'cargo')
provides=("${_pkgname}")
source=('git+https://github.com/blueOkiris/tetris-cli.git')
conflicts=("${_pkgname}-git" "${_pkgname}-bin" "${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_pkgname}
	cargo build --release
}

package() {
	cd ${_pkgname}
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}

