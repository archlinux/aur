# Maintainer: Oliver Sagner <oliver.sagner@jwo.com.de>
pkgname='tu2'
pkgver=10.0f2aac2
pkgrel=1
pkgdesc="Simple Project Management System (english translation pending)"
arch=('i686' 'x86_64')
url="http://github.com/ntropy83/tu2"
license=('GPL')
depends=('qt5-base')
makedepends=('git')
source=("git+https://github.com/ntropy83/tu2.git")
md5sums=('SKIP')

pkgver() {
	cd "tu2"
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
	cd "$srcdir/tu2"
	qmake "Projektverwaltung.pro"
        CONFIG+=release

	make
}

package(){
	cd "${srcdir}/${_pkgname}"

	install -Dm755 tu2/Projektverwaltung "${pkgdir}"/usr/bin/tu2
	install -Dm755 tu2/tu2.desktop "${pkgdir}"/usr/share/applications/tu2.desktop
}
