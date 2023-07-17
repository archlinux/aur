#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=\\).*/\\1{}/" $0'
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap

pkgname=g3kb-switch
pkgver=1.3
pkgrel=1
pkgdesc="CLI keyboard layout switcher for GNOME Shell"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/lyokha/g3kb-switch
depends=(glib2)
makedepends=(cmake)
license=(bsd)
source=("$pkgname-$pkgver::$url/archive/$pkgver.tar.gz")
sha256sums=('d3ca6c943c6733a20a1135d7f4f6f29f0ddfe5502decb36958171ebdfdb96b8a')

build() {
	cd "$pkgname-$pkgver" || exit 1
	cmake -DCMAKE_INSTALL_PREFIX=/usr -Bbuild
	cmake --build build
}

package() {
	cd "$pkgname-$pkgver" || exit 1
	DESTDIR="$pkgdir" cmake --install build
}
