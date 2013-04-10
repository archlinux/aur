# vim:set ft=sh:
# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=kvirtual-git
_gitname="kvirtual"
pkgver=20120603.9609fc8
pkgrel=1
pkgdesc="KDE4 GUI-frontend for kvm/qemu emulator"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KVirtual?content=150682"
license=('GPL2')
depends=('kdebase-runtime' 'qemu')
makedepends=('git' 'cmake' 'automoc4')
provides=('kvirtual')
conflicts=('kvirtual')
source=("$_gitname::git://github.com/didier13150/kvirtual.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	echo $(git log -1 --format="%ci" | sed 's/.*\([0-9]\{4\}\)-\([0-9]\{2\}\)-\([0-9]\{2\}\).*/\1\2\3/').$(git rev-parse --short HEAD)
}

build() {
	msg "creating build directory"
	cd "$srcdir"
	[ -d $_gitname-build ] && rm -rf $_gitname-build
	mkdir $_gitname-build

	msg "Starting make..."
	cd $_gitname-build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo ../$_gitname
	make
}
package() {
	cd "$_gitname-build"
	make DESTDIR="$pkgdir" install
}
