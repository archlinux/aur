#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap
_pkgname=cmakeModules
pkgname=xilinx-cmake
pkgver=2022.1
pkgrel=2
pkgdesc="helpful CMake modules for a variety of Xilinx build flows"
arch=(any)
url=https://github.com/Xilinx/cmakeModules
depends=(cmake)
license=(BSD)
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('af37e4394fed1c8fe3593da384f9fdf5c80c04a48b961cb43b65e13a5625fafd')

package() {
	cd "$srcdir/$_pkgname-$pkgver" || return 1

	mkdir -p "$pkgdir/usr/lib/cmake/xilinx"
	cp ./*.cmake "$pkgdir/usr/lib/cmake/xilinx"
}
