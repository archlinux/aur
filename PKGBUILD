# Maintainer: Riccardo Berto <riccardobrt at gmail dot com>

_pkgname=async_comm
pkgname=async_comm-git
pkgver=r47.9b83a41
pkgrel=1
pkgdesc="This project provides a C++ library that gives a simple interface for asynchronous serial communications over a serial port or UDP."
arch=('x86_64')
url="https://github.com/dpkoch/$_pkgname"
license=('BSD-3')
depends=('cmake' 'boost')
makedepends=('git')
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $_pkgname
	mkdir build && cd build
	cmake .. && make $MAKEFLAGS
}

package() {
        cd $_pkgname
        install -D build/libasync_comm.so $pkgdir/usr/lib/libasync_comm.so
        install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$_pkgname/LICENSE
}
