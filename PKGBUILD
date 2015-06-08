pkgname=to-do-list-manager
pkgver=0.11
pkgrel=2
pkgdesc="A Simple To Do List Manager Written In Qt5"
arch=('any')
url="https://github.com/computerfr33k/To-Do-List-Manager"
license=('GPL3')
groups=('office')
depends=('qt5-base')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/computerfr33k/To-Do-List-Manager/archive/$pkgver.tar.gz"
	"To-Do-List-Manager.desktop")
noextract=()
md5sums=('240aea69f728262c0667ba56e10825ab'
	  '0616a650c9e0a64d1897cf394c6c75d3')

build() {
	cd "$srcdir/To-Do-List-Manager-${pkgver}"

	qmake PREFIX=${pkgdir} To-Do-List-Manager.pro
	make || return 1
	make clean
}

package() {
	cd "$srcdir/To-Do-List-Manager-${pkgver}"
	
	make install
	install -d "${pkgdir}"/opt/To-Do-List-Manager
	install -d "${pkgdir}"/usr/bin

	mv "${pkgdir}/To-Do-List-Manager" "${pkgdir}"/opt/"To-Do-List-Manager"/
	ln -s ${pkgdir}/opt/To-Do-List-Manager/To-Do-List-Manager "${pkgdir}"/usr/bin/To-Do-List-Manager
	
	install -Dm644 "${srcdir}"/To-Do-List-Manager.desktop "${pkgdir}"/usr/share/applications/To-Do-List-Manager.desktop
}
