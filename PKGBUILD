# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=schain
pkgname="${_pkgname}-git"
pkgver=r98.a3954f5
pkgrel=1
pkgdesc='A simple habit tracker'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~arivigo/${_pkgname}"
license=('MIT')
source=("git+https://git.sr.ht/~arivigo/${_pkgname}")
sha256sums=('SKIP')
conflicts=(${_pkgname})

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
