# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=clp
pkgname="${_pkgname}-git"
pkgver=r66.8b7069b
pkgrel=1
pkgdesc='writes input files to stdout with syntax highlighting'
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~eskin/clp"
license=('custom')
depends=('luajit' 'lua51-lpeg' 'lua51-luautf8')
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
