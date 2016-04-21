# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=cvariant-git
_pkgname=${pkgname/-git}
pkgver=r55.b4c1b99
pkgrel=1
pkgdesc="Standalone GVariant Implementation in Standard ISO-C11"
arch=('i686' 'x86_64')
url="https://github.com/bus1/${_pkgname}"
license=('LGPL2.1')
makedepends=('git')
depends=('glibc')
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
