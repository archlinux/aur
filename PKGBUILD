# Maintainer: Jonas Witschel <diabonas@archlinux.org>
pkgname=tang-git
pkgver=8.r0.95d4822
pkgrel=1
pkgdesc='Server for binding data to network presence'
arch=('x86_64')
url='https://github.com/latchset/tang'
license=('GPL3')
depends=('http-parser' 'jose')
makedepends=('git' 'asciidoc' 'meson')
checkdepends=('systemd')
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
	meson compile -C build
}

check() {
	cd "${pkgname%-git}"
	meson test -C build
}

package() {
	cd "${pkgname%-git}"
	DESTDIR="$pkgdir" meson install -C build
}
