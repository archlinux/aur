# Maintainer: Zachary Elliott <contact@zell.io>

pkgname=pdf2laser
pkgver=0.5.0
pkgrel=1
pkgdesc="Tool for printing PDF to an Epilog laser cutter over the network"
arch=('x86_64')
url="https://github.com/zellio/pdf2laser"
license=('GPL3')
depends=('ghostscript')
source=("https://github.com/zellio/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('34920cb0a1e16acd879468536889d211daf2ebf2fce5f4d742d85179eb18616d')

prepare() {
	cd "$pkgname-$pkgver"
	make -f Makefile.dist
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}
