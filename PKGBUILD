# Maintainer: John Troxler <firstname dot lastname at gmail dot com>

pkgname=lsynth
pkgver=3.1.1
pkgrel=1
pkgdesc="LSynth is a program that synthesizes bendable parts for LDraw files"
arch=('x86_64')
url="https://deeice.github.io/lsynth/"
license=('GPL2')
depends=(glibc)
makedepends=(cmake)
source=("$pkgname-$pkgver.tar.gz::https://github.com/deeice/$pkgname/archive/v$pkgver.tar.gz"
        "local://CMakeLists.txt")
sha256sums=('8c1a4286b7ec8512de5c5d61cb6a5a374490dec159cabcf8cd9aa560203d3433'
            '4e6ad6706f685114edbbaa90fc2d739c4f6040c31338dee1782befc6efbbbb6f')

prepare() {
	mkdir "$pkgname-$pkgver-new"
	cd "$pkgname-$pkgver-new"
	mkdir src
	cp -r "../$pkgname-$pkgver/$pkgname/$pkgname/"* src/
        sed -i 's|"lsynth.mpd"|"../share/lsynth/lsynth.mpd"|' src/lsynthcp.c
	cp ../CMakeLists.txt .
}

build() {
	cd "$pkgname-$pkgver-new"
	mkdir build
	cd build
	cmake ..
	cmake --build .
}

package() {
	cd "$pkgname-$pkgver-new/build"
	cmake --install . --prefix "$pkgdir/"
}
