# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.7.0
pkgrel=1
pkgdesc="Folder Integrity Checker"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt6-base' 'qt6-svg')
makedepends=('git' 'cmake')
options=('!debug')

source=("git+https://github.com/artemvlas/${pkgname}.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Release ..
	make -j$(nproc)
}

package() {
	cd "$pkgname"
	cd build
	make install DESTDIR="${pkgdir}"

	# Custom installation
	#install -Dm755 build/src/veretino "${pkgdir}/usr/bin/veretino"
	#install -Dm644 res/veretino.desktop "${pkgdir}/usr/share/applications/veretino.desktop"
	#install -Dm644 res/icons/generic/veretino.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/veretino.svg"
}
