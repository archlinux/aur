# Maintainer: David Phillips <dbphillipsnz@gmail.com>

_pkgname=dodo
pkgname=${_pkgname}-git
pkgver=r130.4df8fe0
pkgrel=1
pkgdesc="Scriptable in-place file editor"
arch=('i686' 'x86_64')
url="https://github.com/mkfifo/${_pkgname}"
license=('MIT')
depends=()
makedepends=('git')
source=("${pkgname}::git+https://github.com/mkfifo/${_pkgname}.git")
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
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/dodo-git/LICENSE"
}
