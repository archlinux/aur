# Maintainer: Calvin Reu <j  dot  calvin  dot  reu at protonmail period com>
# License: MIT
# Repository: https://gitlab.com/calvinreu/kbdmod

pkgname=kbdmod
pkgver=2.0.1
pkgrel=27
epoch=
pkgdesc="modify your keyboard functionality with multi functions per key"
arch=('any')
url="https://gitlab.com/calvinreu/$pkgname"
license=('MIT')
groups=()
depends=(libevdev yaml-cpp interception-tools)
makedepends=(cmake)
checkdepends=(make)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/calvinreu/$pkgname/-/archive/v$pkgver/kbdmod-v$pkgver.tar.gz")
noextract=()
validpgpkeys=()

build() {
	cd "$pkgname-v$pkgver"
	mkdir -p build
	cd build
	cmake .. -DCMAKE_BUILD_TYPE=Release -Dversion="$pkgver"
	make -j 8
}

check() {
	cd "$pkgname-v$pkgver/build"
	make -k cmake_check_build_system
}

package() {
	echo -e "${RED}this package has to be installed as root${NOCOLOR}\nuse pacman -U to install the package"
	cd "$pkgname-v$pkgver/build"
	install -Dm 755 kbdmod.bin "$pkgdir/usr/bin/kbdmod"
	install -Dm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm 644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm 644 ../doc "$pkgdir/usr/share/doc/$pkgname/"
	install -Dm 644 ../examples "$pkgdir/usr/share/example/$pkgname/"
}
sha256sums=('17414263fe91cc42e27ae5faab518eafcd969e22c846b1687ab917353e2c2e4a')
