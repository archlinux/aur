# Maintainer: Philipp A. <flying-sheep@web.de>
pkgname=terrafirma
pkgver=4.0.6
pkgrel=1
pkgdesc='Mapping for Terraria'
arch=(x86_64 aarch64 armv7h)
url='http://seancode.com/terrafirma'
license=(BSD-2-Clause)
makedepends=(git cmake libx11 libxext libxrandr libxcursor libxfixes libxi libxss libxtst libxkbcommon wayland libdecor libglvnd libdrm)
source=("$pkgname-$pkgver::git+https://github.com/mrkite/TerraFirma.git?tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	git submodule init
	git submodule update

	mkdir -p build
	cd build

	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir/usr" ..
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	(cd build; make install)
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
