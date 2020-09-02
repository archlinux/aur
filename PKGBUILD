# Maintainer: x1b6e6 <ftdabcde@gmail.com>

pkgname=pnghide
pkgver=0.1.0
pkgrel=1
pkgdesc="hide plain text in png file inside pixels (unvisible changes)."
url="https://github.com/x1b6e6/pnghide.git"
license=("MIT")
arch=('any')
depends=("libpng")
makedepends=("gcc" "make" "cmake" "png++")
optdepends=("aes: for encryping data")

source=(
	"CMakeLists.txt"
	"pnghide.cc"
	"pngunhide.cc"
)

sha1sums=(
	"df4bfd0e138882f188a9f9d4e133981e32587d69"
	"a18af45c59756345b0c0e7292115bedd283aee63"
	"5f45b2b4397d57601051908e6d5f4e33534585c2"
)

build(){
	cd $srcdir
	cmake -Bbuild -G "Unix Makefiles"
	cmake --build build --target all -- -j2
}

package() {
	cd "$srcdir"
	install -Dm755 "$srcdir/build/pnghide" "$pkgdir/usr/bin/pnghide"
	install -Dm755 "$srcdir/build/pngunhide" "$pkgdir/usr/bin/pngunhide"
}

# vim: set ts=4 sw=4 :
