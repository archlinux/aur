_pkgname=libcsys
pkgname=${_pkgname}-git
pkgver=2.8.0.r0.feb9591
pkgrel=1
pkgdesc="Library for managing drive and getting system resource information in real time."
arch=('any')
url="https://gitlab.com/cubocore/libcsys"
license=('GPL')
depends=('qt5-base' )
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
groups=('coreapps-git')
source=("git+https://gitlab.com/cubocore/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
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
