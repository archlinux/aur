# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=clp
pkgname="${_pkgname}-git"
pkgver=r51.ad1e053
pkgrel=1
pkgdesc='writes input files to stdout with syntax highlighting'
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~eskin/clp"
license=('custom')
depends=('luajit' 'lua-lpeg')
makedepends=('git')
source=("git+${url}")
sha256sums=('SKIP')
conflicts=("${_pkgname}")

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	./configure
  make
}

package() {
	cd "${_pkgname}"
	make MANPREFIX=/usr/share/man DESTDIR="${pkgdir}" PREFIX='/usr' install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
