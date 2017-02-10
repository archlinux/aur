# Maintainer: Matthias Reitinger <reima at edenprime dot de>

pkgname=leocad-git
pkgver=0.83.2.r55.9a2f4c66
pkgrel=1
pkgdesc="A CAD program for creating virtual LEGO models."
arch=('i686' 'x86_64')
url="http://www.leocad.org/"
license=('GPL2')
depends=('qt4')
optdepends=('ldraw-parts-library')
makedepends=('git')
provides=('leocad')
conflicts=('leocad')
source=("$pkgname::git+https://github.com/leozide/leocad.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	qmake-qt4 INSTALL_PREFIX=/usr LDRAW_LIBRARY_PATH=/usr/share/ldraw DISABLE_UPDATE_CHECK=1
	make
}

package() {
	cd "$pkgname"
	make INSTALL_ROOT="$pkgdir" install
}
