# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>

pkgname=italian-draughts-git
pkgver=1.3.3.r0.gb2ad56a
pkgrel=2
pkgdesc="Play Italian Draughts against the computer"
arch=("x86_64")
depends=("wxwidgets-gtk3")
license=("GPL3")
makedepends=("git" "cmake" "scdoc")
source=("$pkgname"::'git+https://github.com/nicolarevelant/italian-draughts.git'
	'italian-draughts.desktop')
url="https://github.com/nicolarevelant/italian-draughts"
sha256sums=('SKIP'
	'99625c7024e47343e9e838abdbc8d30613841afef84afb1fab54f7e024535d00')

build() {
	cd "$pkgname"
	cmake -B build -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr"
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

