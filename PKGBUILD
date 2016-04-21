# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=bus1-base-git
_pkgname=${pkgname/-git}
_gitname=base
pkgver=r184.4552210
pkgrel=1
pkgdesc="Base System Tools"
arch=('i686' 'x86_64')
url="https://github.com/bus1/${_gitname}"
license=('LGPL2.1')
makedepends=('git')
depends=('libbus1-git' 'openssl' 'kmod' 'libelf' 'libcap')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/bus1/${_gitname}.git")
sha512sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
