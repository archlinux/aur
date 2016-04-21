# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=c-sundry-git
_pkgname=${pkgname/-git}
pkgver=r30.8deaceb
pkgrel=1
pkgdesc="Collection of sundry convenience headers"
arch=('i686' 'x86_64')
url="https://github.com/c-util/${_pkgname}"
license=('LGPL2.1')
makedepends=('git')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
replaces=("${_pkgname}")
source=("git+https://github.com/c-util/${_pkgname}.git")
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
