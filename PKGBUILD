# Maintainer: Márton Szabó < echo "bm90cmFtb0B2aXBtYWlsLmh1Cg=="|base64 -d >

pkgname=neph-git
pkgver=v0.2.3.r0.12637dd
pkgrel=1
pkgdesc="A modern command line job processor"
arch=('i686' 'x86_64')
url="https://tbrand.github.io/neph/"
license=('MIT')
depends=('glibc' 'libyaml')
makedepends=('git' 'crystal' 'go-md2man')
provides=('neph')
conflicts=('neph')
source=('neph::git+https://github.com/tbrand/neph.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/neph"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/neph"
        crystal build --release src/neph.cr
	go-md2man -in neph.1.md -out neph.1
}

package() {
	cd "$srcdir/neph"
	install -Dm 755 neph_bin "$pkgdir/usr/bin/neph"
	install -Dm 755 neph.1 "$pkgdir/usr/share/man/man1/neph.1"
}
