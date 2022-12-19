# Maintainter: JKA Network <contacto@jkanetwork.com>
# Contributor:  <reg-archlinux AT klein DOT tuxli DOT ch> 
pkgname=2048-cli-git
_pkgname=2048-cli
_pkgname2=2048
pkgver=r117.6743925
pkgrel=2
pkgdesc="The game 2048 for your Linux terminal"
arch=('x86_64' 'i686')
url="https://github.com/tiehuis/2048-cli"
license=('MIT')
depends=('ncurses' 'sdl')
makedepends=('git')
provides=('2048-cli')
conflicts=('2048.c' '2048.c.git')
source=(git+https://github.com/tiehuis/2048-cli.git)
md5sums=('SKIP')

build() {
	cd "${srcdir}"/"${_pkgname}"
	make
	cd man
	gzip "${_pkgname2}".6
}

pkgver() {
	cd "${_pkgname}"
 	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}"/"${_pkgname}"
	mkdir -p "${pkgdir}"/usr/{bin,share,}
	mkdir -p "${pkgdir}"/usr/share/man/man1
	install -Dm755 "${_pkgname2}" "${pkgdir}"/usr/bin
	install -Dm644 man/"${_pkgname2}".6.gz "${pkgdir}"/usr/share/man/man1
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname2}/LICENSE"
}
