# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=minitimer
pkgname="${_pkgname}-git"
pkgver=r216.88a4034
pkgrel=1
pkgdesc='A timer in your terminal'
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~ariadnavigo/${_pkgname}"
license=('MIT')
makedepends=('git' 'scdoc')
source=("git+${url}")
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
