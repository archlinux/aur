# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=cras
pkgname="${_pkgname}-git"
pkgver=r152.c1429e8
pkgrel=1
pkgdesc='The Anti-Procrastination Tool'
arch=('x86_64' 'aarch64')
url="https://sr.ht/~arivigo/${_pkgname}"
license=('MIT')
depends=('glibc')
source=("git+https://git.sr.ht/~arivigo/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" PREFIX='/usr' install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
