# Maintainer: leotheleon <71839579+leo-the-leon@users.noreply.github.com>

pkgname=mkpsxiso126
pkgver=1.26
pkgrel=1
pkgdesc="Faster, cross-platform, modern BUILDCD replacement (legacy version)"
arch=('i686' 'x86_64')
url="https://github.com/Lameguy64/mkpsxiso"
license=('GPL2')
depends=('tinyxml2')
makedepends=('cmake')
provides=('mkpsxiso')
source=('https://github.com/Lameguy64/mkpsxiso/archive/refs/tags/v1.26.tar.gz'
	'mkisoxml-posix.patch')
cksums=('2302826856'
	'3243613121')

prepare() {
	patch "$srcdir/mkpsxiso-1.26/mkisoxml/src/main.cpp" mkisoxml-posix.patch
}

build() {
	cd "$srcdir/mkpsxiso-1.26"
	cmake .
	make
	cd mkisoxml
	cmake .
	make
}

package() {
	install -Dm755 "$srcdir/mkpsxiso-1.26/bin_nix/mkpsxiso" "$pkgdir/usr/bin/mkpsxiso126"
	install -Dm755 "$srcdir/mkpsxiso-1.26/mkisoxml/bin_nix/mkisoxml" "$pkgdir/usr/bin/mkisoxml"
	install -Dm644 "$srcdir/mkpsxiso-1.26/README.md" "$pkgdir/usr/share/doc/mkpsxiso-1.26/README.md"
	install -Dm644 "$srcdir/mkpsxiso-1.26/LICENSE.md" "$pkgdir/usr/share/doc/mkpsxiso-1.26/LICENSE.md"
	install -Dm644 "$srcdir/mkpsxiso-1.26/examples/example.xml" "$pkgdir/usr/share/doc/mkpsxiso-1.26/example.xml"
}
