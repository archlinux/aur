# Maintainer: Stefan Majewsky <majewsky@gmx.net>
pkgname=cutelyst
pkgver=0.5.0
pkgrel=1
epoch=
pkgdesc="A Web Framework built on top of Qt, using the simple approach of Catalyst (Perl) framework."
arch=('i686' 'x86_64')
url="http://cutelyst.org"
license=('LGPL2.1')
groups=()
depends=('qt5-base' 'uwsgi' 'grantlee-qt5')
# FIXME: no 'clearsilver' in depends=() because the clearsilver dependency is
# not picked up by cutelyst's build (looks like a problem with cutelyst's CMake
# scripts: it looks for libneo_cs.a which is not included in
# clearsilver.pkg.xz)
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("cutelyst::git+https://gitorious.org/cutelyst/cutelyst.git#tag=r${pkgver}")
noextract=()
md5sums=('SKIP') #generate with 'makepkg -g'

pkgver() {
	# The $pkgver is the correct version because we checked out exactly that tag.
	echo $pkgver
}

build() {
	mkdir -p "$srcdir/$pkgname/build"
	cd "$srcdir/$pkgname/build"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ".."
	make
}

package() {
	cd "$srcdir/$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
