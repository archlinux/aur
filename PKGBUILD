# Maintainer: Gustavo Rehermann <rehermann6046@gmail.com>
pkgname=zokumbsp-git
pkgver=v1.0.7.rc1.r191.22af6de
pkgrel=1
pkgdesc="Advanced blockmap, reject and node builder for Doom, Heretic and Hexen (ZenNode fork)"
arch=(x86_64)
url="https://github.com/zokum-no/zokumbsp"
license=('GPL')
groups=()
depends=()
makedepends=(git make)
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=($pkgname'::git+https://github.com/zokum-no/zokumbsp'
		01-makefile-no-enforce-gcc.patch
		02-makefile-use-ldflags.patch
		03-makefile-use-cxxflags.patch
		04-makefile-use-ld.patch)
noextract=()
sha256sums=('SKIP'
            '5e76afc840610b0272e9ae5609d2de6803339e01668c0961d4fb13dd8c86a972'
            '45f7c86c7d25048d3910dfa3dc2d5996d71c9ff997d76efff31c21acac73ca79'
            '9e4181086e4dbb555b7f380e27b4f64268d4012b3ca6ce02b9f2971e5c62e327'
            '90ca1e943a196488b5fdae83a883cfa0a92cd23a8b6446fca6a8c969f05c5527')

prepare() {
	cd "$srcdir/$pkgname"
	patch -Np1 -i ../01-makefile-no-enforce-gcc.patch
	patch -Np1 -i ../02-makefile-use-ldflags.patch
	patch -Np1 -i ../03-makefile-use-cxxflags.patch
	patch -Np1 -i ../04-makefile-use-ld.patch
}

pkgver() {
	cd "$srcdir/$pkgname"

	printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/$pkgname/src/zokumbsp"
	make
}

package() {
	cd "$srcdir/$pkgname/src/zokumbsp"
	mkdir -p "$pkgdir/usr/bin"
	install -t "$pkgdir/usr/bin" ./zokumbsp
}
