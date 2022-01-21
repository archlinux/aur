# Maintainer: Guillaume Meunier <guillaume.meunier@centraliens.net>
pkgname=entt
pkgbase=entt
pkgver=3.9.0
pkgrel=1
epoch=
pkgdesc="A header-only, tiny and easy to use entity-component system (and much more) written in modern C++"
arch=('any')
url="https://skypjack.github.io/entt/"
license=('MIT')
groups=()
makedepends=(cmake)
checkdepends=()
optdepends=()
conflicts=()
backup=()
options=()
install=
changelog=

source=("https://github.com/skypjack/entt/archive/v$pkgver.tar.gz")
sha256sums=('1b06f1f6627c3702486855877bdeab6885f5d821d3dd78862126d4308c627c23')
noextract=()
validpgpkeys=()

build() {
	mkdir -p build
	cd build

	cmake ../$pkgname-$pkgver -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DENTT_USE_LIBCPP=OFF -DENTT_BUILD_TESTING=OFF -DCMAKE_INSTALL_LIBDIR=lib
	make
}

package() {

	pushd build
	DESTDIR="$pkgdir"/ make install
	popd > /dev/null

	mkdir -p "$pkgdir"/usr/share/licenses/$pkgbase
	install $pkgname-$pkgver/LICENSE $pkgdir/usr/share/licenses/$pkgbase/
}

