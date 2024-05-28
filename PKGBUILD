# Maintainer: Wasabi <wasabithumbs@gmail.com>
pkgbase="justin"
pkgname="${pkgbase}"
pkgver="0.0.1"
pkgrel=1
pkgdesc="A minimal AUR helper written in C with support for installation of legacy versions"
arch=('any')
url="https://github.com/WasabiThumb/justin"
license=('Apache-2.0')
depends=('sudo' 'libgit2' 'curl' 'pacman' 'json-c')
makedepends=('base-devel' 'cmake' 'git')
source=("https://github.com/WasabiThumb/justin/archive/refs/tags/${pkgver}.tar.gz")
md5sums=("0a19b6bb7793c30938196f5776ea00ea")
options=(!strip !debug)

build () {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -G "Unix Makefiles" -B ./build -DCMAKE_BUILD_TYPE=Release
	cd build && make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	install -Dm 755 "$srcdir/$pkgname-$pkgver/build/justin" "$pkgdir/usr/bin/justin"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/README.md" "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 "$srcdir/$pkgname-$pkgver/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}
