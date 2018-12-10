# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=jose-git
pkgver=10.r8.028eab5
pkgrel=1
pkgdesc='C-language implementation of Javascript Object Signing and Encryption'
arch=('x86_64')
url='https://github.com/latchset/jose'
license=('APACHE')
depends=('jansson' 'openssl' 'zlib')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf '%s' "$(git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${pkgname%-git}"
	meson --prefix=/usr --buildtype=plain build
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
