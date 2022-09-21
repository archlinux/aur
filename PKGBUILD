# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=scalc
pkgname="${_pkgname}-git"
pkgver=r278.8931273
pkgrel=1
pkgdesc='A very simple stack-based calculator that aims to be small, flexible, and extensible.'
arch=('x86_64' 'aarch64')
url="https://github.com/ariadnavigo/${_pkgname}"
license=('MIT')
makedepends=('sline' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')
conflicts=(${_pkgname})
provides=(${_pkgname})

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	make LDFLAGS="-Wl,-z,now"
}

package() {
	cd "${_pkgname}"
	make MANPREFIX=/usr/share/man DESTDIR="${pkgdir}" PREFIX='/usr' install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
