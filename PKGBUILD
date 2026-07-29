# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=vlink-git
pkgver=0.18a.r0.g432290d
pkgrel=1
pkgdesc='Portable linker for multiple file formats (git version)'
arch=(x86_64)
url='https://github.com/siemens-mobile-hacks/vlink'
license=(custom)
depends=(glibc)
makedepends=(git)
provides=(vlink)
conflicts=(vlink)
source=(git+https://github.com/siemens-mobile-hacks/vlink.git)
sha256sums=(SKIP)

pkgver() {
	cd vlink
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd vlink
	make \
		CC="gcc $CPPFLAGS" \
		CFLAGS="$CFLAGS -std=c99 -pedantic -c" \
		LDOPTS="$LDFLAGS"
}

package() {
	install -Dm755 vlink/vlink "$pkgdir/usr/bin/vlink"
}
