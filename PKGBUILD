# Maintainer: osch <oliver@luced.de>
pkgname=moonfltk
pkgver=0.6
pkgrel=1
epoch=
pkgdesc="Lua bindings for FLTK"
arch=('x86_64')
url="https://github.com/stetre/moonfltk"
license=('MIT')
groups=()
depends=('lua'
         'fltk')
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
source=("https://github.com/stetre/$pkgname/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('1121d4c1416ff6d883165a4b566af647')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	sed -i -e '/#include <stdlib.h>/a #include <stdint.h>' src/internal.h
}

build() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir/usr" install
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname"

	cd "$pkgdir/usr/lib/"
	ln -sfv lua/5.3/moonfltk.so libmoonfltk.so
}
