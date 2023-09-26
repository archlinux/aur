# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=manpager
pkgname="sh-$_pkgname"
pkgver=0.0.2
pkgrel=1
pkgdesc="Colorize $(man XXX)"
arch=(any)
url="https://github.com/Freed-Wu/$_pkgname"
depends=(bat ansifilter)
makedepends=(cmake)
license=(GPL3)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('4a35bad69146d4ad545e8470b49bb0d0f349d47bf8e25a3feb516988b9a02c3e')

build() {
	cd "$_pkgname-$pkgver" || return 1

	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd "$_pkgname-$pkgver" || return 1

	DESTDIR="$pkgdir" cmake --install build
}
