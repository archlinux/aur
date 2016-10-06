# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
pkgname=ibus-kmfl
pkgver=1.0.7
pkgrel=0
pkgdesc="kmfl engine for IBus"
arch=('i686' 'x86_64')
url="http://kmfl.sourceforge.net/"
license=('GPL')
source=("http://packages.sil.org/ubuntu/pool/main/i/ibus-kmfl/ibus-kmfl_1.0.7.orig.tar.gz"
        "http://packages.sil.org/ubuntu/pool/main/i/ibus-kmfl/ibus-kmfl_1.0.7-0ubuntu1.13.diff.gz")
depends=('kmflcomp' 'libkmfl')
noextract=()
options=()
md5sums=('1cc33d159b0b8103dc979dd1bb63b72e' '8d75e3ec845e4ecc1763cd21a9bd7392')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/${pkgname}_$pkgver-0ubuntu1.13.diff"
}

build() {
    LDFLAGS="${LDFLAGS} -lX11"
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
