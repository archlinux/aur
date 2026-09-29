# Maintainer: Anže Pintar <anze@anzepintar.com>

pkgname=anymeal
pkgver=1.35
pkgrel=1
pkgdesc="Recipe management software. Supports MealMaster recipes, import, export, search, display, edit, and printing them."
arch=('x86_64')
url="https://github.com/wedesoft/anymeal"
license=('GPL-3.0-or-later')
depends=('sqlite' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('autoconf' 'automake' 'libtool' 'flex' 'gtest' 'qt6-tools')
source=("$pkgname-$pkgver.tar.xz::https://github.com/wedesoft/anymeal/releases/download/v$pkgver/anymeal-$pkgver.tar.xz")
conflicts=("anymeal-git")
sha256sums=('d8bfa1aaf220bf9bf02b9d19d954ee976f27bfcd53593f8cba14cbc0a8c13faa')

build() {
	cd "$pkgname-$pkgver"

	# Make sure Qt6 tools are used (/usr/bin/moc etc. may point to Qt5)
	export PATH="/usr/lib/qt6:/usr/lib/qt6/bin:$PATH"

	# Qt6 needs C++17, configure only probes up to C++11
	./configure --prefix=/usr CXX="g++ -std=gnu++17"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
