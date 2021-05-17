# Maintainer: Ashley Chiara <PersonaVinny@protonmail.com>
pkgname=yafetch-git
pkgver=1.r4.7214383
pkgrel=2
pkgdesc='yet another fetch, written in C++'
arch=('x86_64')
url='https://gitlab.com/cyberkitty/yafetch'
license=('GPL2')
makedepends=('git' 'make' 'clang')
backup=()
source=('git+https://gitlab.com/cyberkitty/yafetch.git'
	'arch.patch')
sha256sums=('SKIP'
	    '7a20081bbc1ad274b7a92a3ae26f8c48d241e2acf095cc0f1977137ec4a81019')

pkgver() {
	cd "${_pkgname}"
	printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd yafetch
	patch -p1 < ../arch.patch
}

build() {
	cd yafetch
	make
}

package() {
	cd yafetch
	make PREFIX=/usr DESTDIR="${pkgdir}" install
}
