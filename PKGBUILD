# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

_pkgname=cras
pkgname="${_pkgname}-git"
pkgver=r218.c477f53
pkgrel=1
pkgdesc='The Anti-Procrastination Tool'
arch=('x86_64' 'aarch64')
url="https://github.com/ariadnavigo/${_pkgname}.git"
license=('MIT')
depends=('sline')
source=("git+https://git.sr.ht/~arivigo/${_pkgname}")
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
