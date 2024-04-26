# Maintainer: Maiko Tan <maiko.tan.coding@gmail.com>
pkgname=base16384
pkgver=2.3.1
pkgrel=1
epoch=
pkgdesc="Encode binary files to printable utf16be."
arch=('x86_64')
url="https://github.com/fumiama/base16384"
license=('GPL-3.0-only')
groups=()
depends=('glibc')
makedepends=('cmake' 'ninja')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/fumiama/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
sha256sums=('71ee39510c8c687254315ccc1aa5de601a5e2a2554b6db843f3874c12415a77a')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build
}

build() {
	cd "$pkgname-$pkgver"
	cd build
	cmake -DCMAKE_BUILD_TYPE:STRING=Release -G Ninja ..
	cmake --build . --config Release --target all --
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 build/base16384 "$pkgdir/usr/bin/base16384"
	install -Dm755 build/libbase16384.so "$pkgdir/usr/lib/libbase16384.so"
	install -Dm644 base16384.h "$pkgdir/usr/include/base16384.h"

	# Install man page
	install -Dm644 -t "$pkgdir/usr/share/man/man1/" base16384.1 

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
