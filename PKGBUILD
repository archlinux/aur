# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Patryk Kowalczyk < patryk at kowalczyk dot ws>

pkgname=hivex
pkgver=1.3.13
pkgrel=1
pkgdesc="System for extracting the contents of Windows Registry."
arch=("i686" "x86_64")
url="http://libguestfs.org"
license=("LGPL2.1")
depends=("libxml2" "perl")
makedepends=("python2" "ruby" "perl-io-stringy" "perl-test-simple" "ocaml-findlib" "ocaml")
optdepends=("python2: for python bindings"
	    "ruby: for ruby bindings"
	    "ocaml: for ocaml bindings")
options=("!emptydirs" "!libtool")
source=("http://libguestfs.org/download/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('a4c9cb138c0cb839759c54b59e52793f')

build() {
    cd $pkgname-$pkgver
    unset PREFIX
    ./configure \
	--bindir=/usr/bin \
	--libdir=/usr/lib \
	--prefix=/usr \
	--disable-rpath \
	--disable-static PYTHON=python2
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
