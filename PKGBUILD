# Maintainer: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>
pkgname=qlog-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r2.c705f4c
pkgrel=1
pkgdesc="Amateur radio logbook software"
arch=("x86_64" "i686")
url="https://github.com/7h0ma5/QLog"
license=('GPL')
groups=()
depends=('qt5-base' 'qt5-charts' 'hamlib')
makedepends=('git' 'qt5-tools')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('git://github.com/7h0ma5/QLog')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/QLog"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/QLog"
	qmake PREFIX=${pkgdir}/usr QLog.pro
	make || return 1
}

package() {
	cd "$srcdir/QLog"
	make install || return 1
}
