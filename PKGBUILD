# Contributor: Ninez <triplesquarednine AT gmail DOT com>
# Contributor: N30N <archlinux@alunamation.com>
# Maintainer: SanskritFritz (gmail)

pkgname="tupi-git"
pkgver=156.11cadda
pkgrel=2
pkgdesc="A 2D animation tool for 8-100 years old kids."
url="http://www.maefloresta.com/"
license=("GPL3")
arch=("i686" "x86_64")
depends=("qt5-tools" "qt5-multimedia" "qt5-svg" "quazip-qt5" "libtheora" "ffmpeg" "aspell" "shared-mime-info")
makedepends=("git" "ruby" "zlib" "libgl")
source=("git://anongit.kde.org/tupi")
md5sums=("SKIP")
install="tupi.install"

pkgver() {
	cd tupi
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd tupi
	./configure \
		--prefix="/usr" \
		--libdir="/usr/lib" \
		# --sharedir="/usr/share/tupi"
		# --with-debug \
	make
}

package() {
	cd tupi
	make DESTDIR="$pkgdir" install

	sed "s|$pkgdir||" -i "$pkgdir/usr/bin/tupi"
}
