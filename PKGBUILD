# Contributor: Popoolon <popolon at popolon.org>
# Contributor: Jonathan Lestrelin <jonathan.lestrelin@gmail.com>

pkgname=openlara-git
_pkgname=openlara
_prjname=OpenLara
pkgver=r1430.b4bcd4a
pkgrel=3
pkgdesc="Classic Tomb Raider open-source engine"
url="https://github.com/XProger/OpenLara"
license=('unknown')
arch=("x86_64" "aarch64" "riscv64")
makedepends=('git' 'clang')
depends=('libx11' 'libgl' 'libpulse' 'sdl2')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/XProger/${_prjname}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_prjname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$_prjname/src/platform/sdl2"
	./build.sh
}

package() {
	install -Dm755 "$srcdir/$_prjname/src/platform/sdl2/OpenLara" "$pkgdir/usr/bin/openlara"
#	install -m 644 "$srcdir/$_prjname/bin/LEVEL2.PSX" "$pkgdir/usr/share/openlara/LEVEL2.PSX"
#	install -m 644 "$srcdir/$_prjname/bin/05.ogg" "$pkgdir/usr/share/openlara/05.ogg"
#	install -m 644 "$srcdir/$_prjname/bin/008.ogg" "$pkgdir/usr/share/openlara/008openlara.ogg"
	# use a wrapper as the program needs its CWD to be the directory containing the data files
	#echo -e '#!/bin/sh\nset -eu\ncd /usr/share/openlara\n/usr/lib/openlara/OpenLara $@' > "$pkgdir/usr/bin/openlara"
	#chmod 0755 "$pkgdir/usr/bin/openlara"
}
