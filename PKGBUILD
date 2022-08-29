# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=minitimer
pkgname="${_pkgname}-git"
pkgver=r195.8143449
pkgrel=1
pkgdesc='A timer in your terminal'
arch=('x86_64' 'aarch64')
url="https://github.com/ariadnavigo/${_pkgname}.git"
license=('MIT')
makedepends=('git')
source=("git+${url}")
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
