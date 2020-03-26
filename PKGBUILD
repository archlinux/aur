_pkgname=corestuff
pkgname=${_pkgname}-git
pkgver=2.8.0.r33.e34954b
pkgrel=1
pkgdesc="An activity viewer from the CoreApps family."
arch=('any')
url="https://gitlab.com/cubocore"
license=('GPL3')
depends=('qt5-x11extras' 'libcprime-git' 'libcsys-git' 'libdesq-git')
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
