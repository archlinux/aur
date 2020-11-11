_pkgname=libdesqwl
pkgname=${_pkgname}-git
pkgver=r6.cd1bdb6
pkgrel=1
pkgdesc="Wayland support for DesQ"
arch=('any')
url="https://gitlab.com/DesQ"
license=('none')
depends=('qt5-base' 'qt5-wayland' 'wayfire')
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
