# Maintainer: leotheleon <71839579+leo-the-leon@users.noreply.github.com>

pkgname=mkpsxiso-git
pkgver=2.02
pkgrel=1
pkgdesc="Faster, cross-platform, modern BUILDCD replacement"
arch=('i686' 'x86_64')
url="https://github.com/Lameguy64/mkpsxiso"
license=('GPL2')
makedepends=('cmake')
source=("git+${url}.git")
cksums=('SKIP')

prepare() {
	cd "$srcdir/mkpsxiso"
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/mkpsxiso"
	cmake -S . -B ./build -DCMAKE_BUILD_TYPE=Release
	cmake --build ./build
}

package() {
	install -Dm755 "$srcdir/mkpsxiso/build/mkpsxiso" "$pkgdir/usr/bin/mkpsxiso"
	install -Dm755 "$srcdir/mkpsxiso/build/dumpsxiso" "$pkgdir/usr/bin/dumpsxiso"
	install -Dm644 "$srcdir/mkpsxiso/README.md" "$pkgdir/usr/share/doc/mkpsxiso/README.md"
	install -Dm644 "$srcdir/mkpsxiso/LICENSE.md" "$pkgdir/usr/share/doc/mkpsxiso/LICENSE.md"
	install -Dm644 "$srcdir/mkpsxiso/examples/example.xml" "$pkgdir/usr/share/doc/mkpsxiso/example.xml"
}
