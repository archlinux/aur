_pkgname=libarchive-qt
pkgname=${_pkgname}-git
pkgver=1.1.1.r0.b653d20
pkgrel=1
pkgdesc="A Qt based archiving solution with libarchive backend."
arch=('any')
url="https://gitlab.com/marcusbritanicus/libarchive-qt"
license=('LGPL-3.0')
depends=('libarchive' 'qt5-base' 'zlib' 'bzip2' 'xz')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
groups=('coreapps-git')
source=("git+https://gitlab.com/marcusbritanicus/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "%s" "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
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
