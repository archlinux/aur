# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=undollar
pkgname=sh-$_pkgname
pkgver=0.0.4
pkgrel=1
pkgdesc="strip the dollar sign from the beginning of the terminal command"
arch=(any)
url=https://github.com/Freed-Wu/undollar
makedepends=(cmake)
license=(GPL3)
provides=(undollar)
conflicts=(undollar)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('101575978d1a5b661597fe1bfe419508c61bb4ee89a82498b58d05a5dfed0c49')

build() {
	cd "$_pkgname-$pkgver" || return 1

	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd "$_pkgname-$pkgver" || return 1

	DESTDIR="$pkgdir" cmake --install build
}
