# Maintainer: Jesin <Jesin00@gmail.com>
pkgname=advancecomp-git
_name="${pkgname%-git}"
pkgver=2.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Recompression tools for gz, mng, png, and zip files using Zopfli and 7-Zip DEFLATE algorithms'
license=('GPL')
depends=('gcc-libs' 'zlib')
makedepends=('git')
provides=("$_name")
conflicts=("$_name")
url="https://github.com/amadvance/$_name"
source=("git+$url")
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/$_name"
	git describe --tags | sed 's/^v//;s/-/+/g'
}

export LDFLAGS+=' -pie'
build() {
	cd "$srcdir/$_name"
	autoheader
	./autogen.sh
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd "$srcdir/$_name"
	make "DESTDIR=$pkgdir" install
}
