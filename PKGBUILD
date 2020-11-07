# Maintainer: Patrick Ausel <TheSheepGuy1@gmail.com>

_pkgname=vgmtrans
pkgname=$_pkgname-git
pkgver=20170225.r389.gab59327
pkgrel=1
pkgdesc="Converter for sequenced videogame music"
arch=("x86_64")
url="https://github.com/vgmtrans/vgmtrans"
license=('ZLIB')
depends=("qt5-base" "fluidsynth")
makedepends=("qt5-tools" "cmake" "git")
source=("$_pkgname::git+git://github.com/vgmtrans/vgmtrans.git#branch=refactor")
sha256sums=("SKIP")

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --long --tags | sed "s/^interim-//;s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
	cmake -B build $_pkgname
	make -C build
}

package() {
	install -Dm755 "build/src/vgmtrans-qt/vgmtrans" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "$_pkgname/LICENSE.txt" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
	install -Dm755 "$_pkgname/data/vgmtrans.desktop" "$pkgdir/usr/share/applications/vgmtrans.desktop"
}
