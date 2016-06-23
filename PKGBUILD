# Maintainer: Narthorn <narthorn@gmail.com>

_pkgname=mtr
pkgname=$_pkgname-git
pkgver=v0.86.r64.g85c7550
pkgrel=1
arch=('any')
pkgdesc='Combines the functionality of traceroute and ping into one tool (CLI version, git)'
url='http://www.bitwizard.nl/mtr/'
license=('GPL')
makedepends=('git')
depends=('ncurses')
provides=($_pkgname)
conflicts=($_pkgname)
install=$_pkgname.install
source=('git://github.com/traviscross/mtr')
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgname
	./bootstrap.sh
	./configure --prefix=/usr --without-gtk --sbindir=/usr/bin
	make
}

package() {
	cd $_pkgname
	make DESTDIR="$pkgdir" install
}
