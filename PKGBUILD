# Maintainer: Márton Szabó < echo "bm90cmFtb0B2aXBtYWlsLmh1Cg=="|base64 -d >

pkgname=neph-git
pkgver=v0.1.17.r0.f968d2a
pkgrel=1
pkgdesc="A modern command line job processor"
arch=('i686' 'x86_64')
url="https://tbrand.github.io/neph/"
license=('MIT')
depends=('glibc')
makedepends=('git' 'crystal')
provides=("neph")
conflicts=("neph")
source=('neph::git+https://github.com/tbrand/neph.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/neph"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/neph"
        crystal build --release src/bin/neph_bin.cr
}

package() {
	cd "$srcdir/neph"
        install -d "$pkgdir/usr/bin"
	cp neph_bin "$pkgdir/usr/bin/neph"
}
