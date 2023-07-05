# Maintainer: Nicola Revelant <nicolarevelant@outlook.com>

pkgname=italian-draughts-git
pkgver=1.3.3.r2.g797d4a7
pkgrel=1
pkgdesc="Play Italian Draughts against the computer"
arch=("x86_64")
depends=("wxwidgets-gtk3")
license=("GPL3")
makedepends=("git" "cmake" "scdoc")
url="https://github.com/nicolarevelant/italian-draughts"
source=("$pkgname"::"git+$url.git"
	'italian-draughts.desktop')
sha256sums=('SKIP'
	'99625c7024e47343e9e838abdbc8d30613841afef84afb1fab54f7e024535d00')

build() {
	cd "$pkgname"
	cmake -B build -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr"
	cmake --build build
}

package() {
	install -Dm 644 italian-draughts.desktop -t "$pkgdir/usr/share/applications"
	cd "$pkgname"
	cmake --install build --prefix "$pkgdir/usr"
	install -Dm 644 logo/italian-draughts.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
}

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
