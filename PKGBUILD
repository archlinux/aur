# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=tang-git
pkgver=7.r3.590de27
pkgrel=1
pkgdesc='Server for binding data to network presence'
arch=('x86_64')
url='https://github.com/latchset/tang'
license=('GPL3')
depends=('http-parser' 'jose')
makedepends=('git' 'asciidoc' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
	cd "${pkgname%-git}"
	meson --libexecdir=/usr/lib --buildtype=plain build
	ninja -C build
}

check() {
	cd "${pkgname%-git}"
	ninja -C build test
}

package() {
	cd "${pkgname%-git}"
	DESTDIR="$pkgdir" ninja -C build install
}
