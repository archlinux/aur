# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=libbus1-git
_pkgname=${pkgname/-git}
pkgver=r126.ccf53fb
pkgrel=1
pkgdesc="Bus1 IPC Library"
arch=('i686' 'x86_64')
url="https://github.com/bus1/${_pkgname}"
license=('LGPL2.1')
makedepends=('git')
depends=('crbtree-git' 'cvariant-git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("git+https://github.com/bus1/${_pkgname}.git")
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
