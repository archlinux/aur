# Contributor: Ninez <triplesquarednine AT gmail DOT com>
# Contributor: N30N <archlinux@alunamation.com>
# Maintainer: SanskritFritz (gmail)

pkgname="tupi"
_pkgver=0.2-git05
pkgver=${_pkgver//-/_}
pkgrel=2
pkgdesc="A 2D animation tool for 8-100 years old kids."
url="http://www.maefloresta.com/"
license=("GPL3")
arch=("i686" "x86_64")
depends=("qt5-multimedia" "qt5-svg" "quazip-qt5" "ffmpeg" "shared-mime-info")
makedepends=("ruby" "zlib" "libgl")
source=("http://sourceforge.net/projects/tupi2d/files/Source%20Code/tupi-$_pkgver.tar.gz" 
        "quazip5.patch")
md5sums=('9283f51f2a9798171fc25b0360845b1b'
         'c8e05ddef493102349e3f15b07e0c6e2')
install="tupi.install"

prepare() {
	cd tupi-$_pkgver
	patch -p1 -i ../quazip5.patch
}

build() {
	cd tupi-$_pkgver
	./configure \
		--prefix="/usr" \
		--libdir="/usr/lib" \
		--with-quazip="/usr" \
		# --sharedir="/usr/share/tupi"
		# --with-debug \
	make
}

package() {
	cd tupi-$_pkgver
	make DESTDIR="$pkgdir" install

	sed "s|$pkgdir||" -i "$pkgdir/usr/bin/tupi"
}
