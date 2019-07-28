pkgname=blarb
pkgver="1.3.0"
pkgrel=3
pkgdesc="The Blarb programming language."
arch=('x86_64')
url="https://github.com/elimirks/BlarbVM"
license=('ISC')
depends=()
makedepends=('flex' 'gcc' 'git' 'make')
provides=('blarb')
conflicts=('blarb')
backup=('etc/xdg/blarb/config')
source=("git://github.com/elimirks/BlarbVM.git")
md5sums=('SKIP')
_gitname="BlarbVM"

libpath=

prepare() {
  cd "$srcdir/$_gitname"
	git checkout $pkgver
}

build() {
  cd "$srcdir/$_gitname"
	make BLARB_LIBRARY_PATH=/usr/lib/blarb
}

package() {
  cd "$srcdir/$_gitname"
  install -D -m755 ./blarb "$pkgdir/usr/bin/blarb"

	mkdir -p "$pkgdir/usr/lib"
  cp -r ./library "$pkgdir/usr/lib/blarb"
  chmod -R 755 "$pkgdir/usr/lib/blarb"
}
