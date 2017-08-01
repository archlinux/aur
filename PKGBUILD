# Maintainer: Hanspeter Porner <dev@open-music-kontrllers.ch>
_pkgname=CUnit
_pkgver="2.1-3"
pkgname=cunit
pkgver=2.1.3
pkgrel=1
epoch=
pkgdesc="A Unit Testing Framework for C."
arch=(i686 x86_64 armv7h)
url="http://cunit.sourceforge.net"
license=('LGPL2.1')
groups=()
depends=('glibc')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://downloads.sourceforge.net/project/cunit/$_pkgname/$_pkgver/$_pkgname-$_pkgver.tar.bz2")
noextract=()
md5sums=('b5f1a9f6093869c070c6e4a9450cc10c')
validpgpkeys=()

prepare() {
	cd "$_pkgname-$_pkgver"
}

build() {
	cd "$_pkgname-$_pkgver"
	./bootstrap
	./configure \
		--prefix=/usr \
		--enable-test \
		--enable-shared \
		--enable-static
	make
}

check() {
	cd "$_pkgname-$_pkgver"

	CUnit/Sources/Test/test_cunit
}

package() {
	cd "$_pkgname-$_pkgver"
	make DESTDIR="$pkgdir/" install

	rm -r $pkgdir/usr/share/CUnit
	mv $pkgdir/usr/doc $pkgdir/usr/share/
}
