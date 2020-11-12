_pkgname=paperdesktop
pkgname=${_pkgname}-git
pkgver=r127.960ff1e
pkgrel=1
pkgdesc="An awesome Desktop Environment built on top of Qt/Wayland and wayfire."
arch=('any')
url="https://gitlab.com/cubocore/paper/"
license=('GPL3')
depends=('qt5-base' 'qt5-wayland' 'qt5-connectivity' 'qt5-svg' 'udisks2' 'wayfire' 'libdbusmenu-qt5')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
groups=('paperdesktop-git')
source=("git+https://gitlab.com/cubocore/paper/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	qmake-qt5 ${_pkgname}.pro
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make INSTALL_ROOT=${pkgdir} install
}
