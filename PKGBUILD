# Maintainer: David Phillips <dbphillipsnz@gmail.com>

_pkgname=dodo
pkgname=${_pkgname}-git
pkgver=r74.f4d89e7
pkgrel=1
pkgdesc="Scriptable in-place file editor"
arch=('i686' 'x86_64')
url=(https://github.com/mkfifo/${_pkgname})
license=('MIT')
depends=()
makedepends=('git')
source=("${pkgname}::git://github.com/mkfifo/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	make -C "${srcdir}/${pkgname}" \
		PREFIX=/usr/
}

package() {
	make -C "${srcdir}/${pkgname}" \
		DESTDIR="${pkgdir}" \
		install
}
