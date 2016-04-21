# Maintainer: Timothée Ravier <tim@siosm.fr>

pkgname=c-variant-git
_pkgname=${pkgname/-git}
pkgver=r59.d1cdeef
pkgrel=1
pkgdesc="Standalone GVariant Implementation in Standard ISO-C11"
arch=('i686' 'x86_64')
url="https://github.com/c-util/${_pkgname}"
license=('LGPL2.1')
makedepends=('git')
depends=('glibc')
provides=("${_pkgname}" "cvariant-git")
conflicts=("${_pkgname}" "cvariant-git")
replaces=("${_pkgname}" "cvariant-git")
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
