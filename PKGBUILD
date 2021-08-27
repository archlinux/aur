# Maintainer: pryme-svg <edoc.www@gmail.com>

_basename="man2html"

pkgname="vh-man2html"
pkgver=1.6g
pkgrel=1
pkgdesc="convert man pages into HTML format"
arch=('x86_64')
url="http://users.actrix.co.nz/michael/vhman2html.html"
license=('GPL2')
depends=()
makedepends=()
optdepends=()
provides=('man2html')
conflicts=('man2html')
source=("https://salsa.debian.org/debian/man2html/-/archive/upstream/$pkgver/man2html-upstream-$pkgver.tar.gz"
		"doctype.patch")
sha256sums=('67f51a29806abc97c279e3a35af0c1df613daec011e98d2c63281af55632efd5'
            'd0465a1b82e22b7d72da3c9af7ef465ff7d262f0d0729f631e20a44cec716682')

prepare() {
	cd "$_basename-upstream-$pkgver"
	patch -p1 -i $srcdir/doctype.patch
}

build() {
	cd "$_basename-upstream-$pkgver"
	./configure -d +fhs
	make
}

package() {
	cd "$_basename-upstream-$pkgver"
	make DESTDIR="$pkgdir/" install -C man2html # don't need CGI service
}
