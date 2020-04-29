# Maintainer: Patrick Ausel <TheSheepGuy1@gmail.com>

pkgname=vgmtrans-git
pkgver=20170225.r352.g33e840d
pkgrel=2
pkgdesc="Convert console video games music files to standard MIDI and DSL/SF2 files."
arch=("x86_64")
url="https://github.com/vgmtrans/vgmtrans"
license=('ZLIB')
depends=("qt5-base" "fluidsynth")
makedepends=("qt5-tools" "cmake" "git")
source=("$pkgname::git+git://github.com/vgmtrans/vgmtrans.git#branch=refactor")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$pkgname"
	git describe --long --tags | sed "s/^interim-//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
	cmake -B build $pkgname
	make -C build
}

package() {
	install -Dm755 "build/src/vgmtrans-qt/vgmtrans" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
