# Maintainer: Nathaniel Crosby <ncrosby96@gmail.com>
pkgname=hrmp
pkgver=0.14.0
pkgrel=1
pkgdesc="High resolution music player for Linux"
arch=(x86_64)
url="https://github.com/HighResMusicPlayer/$pkgname"
license=('GPLv3')
conflicts=(hrmp-git)
depends=(libsndfile opus faad2 gtk4 ncurses python-docutils)
makedepends=(clang cmake)
optdepends=(pandoc texlive-basic)
provides=("$pkgname")
source=("https://github.com/HighResMusicPlayer/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('99428097f92203f25ccd295cc4bb86d79754f87406115bc847be0694ea2b98d1')

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	cmake -DCMAKE_C_COMPILER=clang -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="${pkgdir}" cmake --build "${srcdir}/$pkgname-$pkgver/build" --target install
}
