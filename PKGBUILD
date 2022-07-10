# Maintainer: Aozora <email at aozora dot my dot id>

pkgname=dvdbounce
pkgver=1.31
pkgrel=1
pkgdesc="A program that simulates the retro DVD screensaver"
arch=(x86_64)
url="https://github.com/George-lewis/DVDBounce"
license=('GPL3')
depends=(sfml)
makedepends=(cmake cxxopts)
source=("$pkgname-$pkgver.tar.gz::https://github.com/George-lewis/DVDBounce/archive/v${pkgver}.tar.gz"
		"0001-Don-t-use-conan.patch"
		"0001-Fix-path.patch")
sha256sums=("3a4347687d2bf1fe732f8723434af67e67a256db982af147bda3cb61128693c0"
			"SKIP"
			"SKIP")

prepare() {
	cd "DVDBounce-$pkgver"
	patch -p1 -i "$srcdir/0001-Don-t-use-conan.patch"
	patch -p1 -i "$srcdir/0001-Fix-path.patch"
}

build() {
	cd "DVDBounce-$pkgver"
	mkdir -p build && cd build
	cmake .. && cmake --build .
}

package() {
	cd "DVDBounce-$pkgver"
	install -Dm 775 "build/$pkgname" "$pkgdir/usr/bin/$pkgname"
	mkdir -p "$pkgdir/usr/share/dvdbounce"
	cp -r "resources" "$pkgdir/usr/share/dvdbounce/"
}