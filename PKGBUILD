# Maintainer: mcgyver <newsletter.sergio@gmail.com>

pkgname=pcapplusplus-git
pkgver=22.11.r104.gfb3a5604
pkgrel=1
pkgdesc="A multi-platform C++ library for capturing, parsing and crafting of network packets"
arch=("x86_64")
url="https://pcapplusplus.github.io/"
license=('Unlicense')
makedepends=("git")
depends=("libpcap" "glibc" "gcc-libs")
source=("pcapplusplus::git+https://github.com/seladb/PcapPlusPlus.git")
sha256sums=('SKIP')

pkgver() {
  cd "pcapplusplus"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/\./g'
}

build() {
	cd "pcapplusplus"
	mkdir -p "build"
	cd build
	cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_INSTALL_LIBDIR='/usr/lib/pcapplusplus' ..
	make
}

package() {
  cd "$srcdir/pcapplusplus/build"
  make DESTDIR="$pkgdir" install
}


#package() {
#	cd "pcapplusplus/Dist" || exit 1
#	mkdir -p "$pkgdir/usr/bin"
#	cp examples/* "$pkgdir/usr/bin"
#	mkdir -p "$pkgdir/usr/include/pcapplusplus"
#	cp header/*   "$pkgdir/usr/include/pcapplusplus"
#	mkdir -p "$pkgdir/usr/lib/pcapplusplus"
#	cp ./*.a      "$pkgdir/usr/lib/pcapplusplus"
#}
