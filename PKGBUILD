_pkgname=libdesqui
pkgname=${_pkgname}-git
pkgver=r6.4b03a50
pkgrel=1
pkgdesc="DesQ UI Library. This library contains all the common UI widget which are to be used across the DesQ Project."
arch=('any')
url="https://gitlab.com/DesQ"
license=('none')
depends=('libdesq-git')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
groups=('desq-git')
source=("git+https://gitlab.com/Desq/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	qmake
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make INSTALL_ROOT=${pkgdir} install
}
