# Maintainer: cypmon <randalchem AT protonmail DOT com>
_pkgname=cmkr
pkgname=cmkr-git
pkgver=v0.2.4.r1.6c1e388
pkgrel=1
pkgdesc="Modern build system based on CMake and TOML."
arch=(x86_64)
url="https://github.com/build-cpp/cmkr"
license=('MIT')
makedepends=(git cmake)
provides=(cmkr)
source=("$_pkgname-$pkgver::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname-$pkgver"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cmake -B build -S "$_pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr 
	make -C build
}

package() {
	make DESTDIR="$pkgdir/" -C build install
	cd "$_pkgname-$pkgver"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

