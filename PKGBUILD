# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=undollar
pkgname=sh-$_pkgname
pkgver=0.0.5
pkgrel=1
pkgdesc="strip the dollar sign from the beginning of the terminal command"
arch=(any)
url=https://github.com/Freed-Wu/undollar
makedepends=(cmake)
license=(GPL3)
provides=(undollar)
conflicts=(undollar)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('29140b79e4eb6a3281a7defe43108dcd05133c6b7a92e2ec5a9716eb9216fbbb')

build() {
	cd "$_pkgname-$pkgver" || return 1

	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd "$_pkgname-$pkgver" || return 1

	DESTDIR="$pkgdir" cmake --install build
}
