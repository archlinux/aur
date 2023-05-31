# Maintainer: nicolarevelant44 <nicolarevelant44@outlook.com>

pkgname=italian-draughts-git
pkgver=1.3.2.r2.g41f62e0
pkgrel=1
pkgdesc="Italian Draughts, a strategy game for 2 players written in C++"

arch=("x86_64")
depends=("wxwidgets-gtk3")
license=("GPL3")
makedepends=("git" "cmake" "scdoc")
source=("$pkgname"::'git+https://github.com/nicolarevelant/italian-draughts.git'
	'italian-draughts.desktop')
url="https://github.com/nicolarevelant/italian-draughts"
sha256sums=('SKIP'
	'3300918286847221d374ab02600444ecc9fe26d7cd8a90beae02d1a3dceffbf8')

build() {
	cd "$pkgname"
	cmake -B build -DCMAKE_BUILD_TYPE="Release"
	cmake --build build
}

package() {
	cd "$pkgname"
	cmake --install build --prefix "$pkgdir/usr"
	cd ..
	mkdir -p "$pkgdir/usr/share/applications"
	install -m 644 italian-draughts.desktop "$pkgdir/usr/share/applications"
}

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

