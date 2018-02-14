# Maintainer: Jesin <Jesin00@gmail.com>
pkgname=advancecomp-git
_name="${pkgname%-git}"
pkgver=2.1
pkgrel=1
arch=(x86_64)
pkgdesc='Recompression tools for gz, mng, png, and zip files using Zopfli and 7-Zip DEFLATE algorithms'
license=(GPL3)
depends=(gcc-libs zlib)
makedepends=(git)
provides=("$_name")
conflicts=("$_name")
url="https://github.com/amadvance/$_name"
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
	cd "$_name"
	local v="$(git describe --tags)"
	v="${v#v}"
	printf %s "${v//-/+}"
}

build() {
	cd "$_name"
	autoheader
	./autogen.sh
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "$_name"
	make "DESTDIR=$pkgdir" install
	install -Dm644 "-t$pkgdir/usr/share/doc/$_name" AUTHORS HISTORY README
}
