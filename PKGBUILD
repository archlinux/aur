#!/usr/bin/env -S sh -c 'nvchecker -cnvchecker.toml --logger=json | jq -r '\''.version | sub("^v"; "") | split("-") | .[-1]'\'' | xargs -i{} sed -i "s/^\\(pkgver=1.4
# shellcheck shell=bash disable=SC2034,SC2154
# ex: nowrap

pkgname=g3kb-switch
pkgver=1.4
pkgrel=1
pkgdesc="CLI keyboard layout switcher for GNOME Shell"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/lyokha/g3kb-switch
depends=(glib2)
makedepends=(cmake)
license=(bsd)
source=("$pkgname-$pkgver::$url/archive/$pkgver.tar.gz")
sha256sums=('f8f42fbd23ea1b57bb1891577965cf207d48235378c2231cb3b7f7cd0b75c8ba')

build() {
	cd "$pkgname-$pkgver" || exit 1
	cmake -DCMAKE_INSTALL_PREFIX=/usr -Bbuild
	cmake --build build
}

package() {
	cd "$pkgname-$pkgver" || exit 1
	DESTDIR="$pkgdir" cmake --install build
}
