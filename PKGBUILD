_pkgname=libdesq
pkgname=${_pkgname}-git
pkgver=r70.070b841
pkgrel=1
pkgdesc="The DesQ library to handle X11 protocols, system calls, classes and functions to be used across the DesQ project."
arch=('any')
url="https://gitlab.com/DesQ"
license=('none')
depends=('qt5-base')
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
