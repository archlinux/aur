_pkgname=coreaction
pkgname=${_pkgname}-git
pkgver=2.8.0.r1.a796070
pkgrel=1
pkgdesc="A side bar for showing widgets from the CoreApps family."
arch=('any')
url="https://gitlab.com/cubocore"
license=('GPL3')
depends=('libcprime-git' 'libcsys-git' 'qt5-svg' )
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
