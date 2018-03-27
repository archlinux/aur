# Contributor: Ninez <triplesquarednine AT gmail DOT com>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: sekret (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname="tupitube.desk"
pkgver=0.2.10
pkgrel=1
pkgdesc="A design and authoring tool for digital artists interested in 2D animation."
url="https://www.maefloresta.com/"
license=("GPL3")
arch=("i686" "x86_64")
depends=("qt5-multimedia" "qt5-svg" "quazip" "ffmpeg" "shared-mime-info")
conflicts=("tupi")
makedepends=("ruby" "zlib" "libgl")
source=("http://sourceforge.net/projects/tupi2d/files/Source%20Code/$pkgname-$pkgver.tar.gz" 
        "quazip5.patch")
md5sums=('1c4db742a301e3169bcfeb7b5e80bff7'
         'b5da9bd90ef57e6778f4e281572da3eb')

prepare() {
	cd "${pkgname}_$pkgver"
	patch -p1 -i ../quazip5.patch
}

build() {
	cd "${pkgname}_$pkgver"
	./configure \
		--libdir="/usr/lib" \
		--without-debug
# 		--sharedir="/usr/share/tupi" \
	make
}

package() {
	cd "${pkgname}_$pkgver"
	make DESTDIR="$pkgdir" install

}
