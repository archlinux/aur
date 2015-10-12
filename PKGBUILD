# Maintainer: Narthorn <narthorn@gmail.com>

_pkgname=mtr
pkgname=$_pkgname-git
pkgver=v0.86.r25.g4831ee5
pkgrel=1
arch=('any')
pkgdesc='Combines the functionality of traceroute and ping into one tool (CLI version, git)'
url='http://www.bitwizard.nl/mtr/'
license=('GPL')
makedepends=('git' 'ncurses')
depends=('ncurses')
provides=($_pkgname)
conflicts=($_pkgname)
source=('git+https://github.com/traviscross/mtr'
        '0001-curses-Fix-background-transparency-in-terminal.patch')
sha256sums=('SKIP'
			'4ff43c424870514568922244b2247a7052c14c15ca7cc649a23112dc3d7e274f')

pkgver() {
	cd $_pkgname
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g' 
}

prepare() {
	cd $_pkgname
	git am $srcdir/0001-curses-Fix-background-transparency-in-terminal.patch 
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
