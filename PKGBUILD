# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=sline
pkgname="${_pkgname}-git"
pkgver=r157.afa1ce8
pkgrel=1
pkgdesc='Simple line-editing and command history library.'
arch=('any')
url="https://git.sr.ht/~ariadnavigo/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('git' 'scdoc')
source=("git+${url}")
sha256sums=('SKIP')
conflicts=(${_pkgname})
provides=(${_pkgname})

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${_pkgname}"
	sed -i "s/LDFLAGS.*$/&,-z,now/" config.mk
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" PREFIX='/usr' MANPREFIX=/usr/share/man install
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
