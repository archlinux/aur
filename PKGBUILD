# Maintainer: Yadav Gowda <yadav . gowda __at__ gmail . com>
pkgname=kmflcomp
pkgver=0.9.8
pkgrel=1.1
pkgdesc="KMFL (Keyboard Mapping for Linux) compiler library"
arch=('i686' 'x86_64')
url="http://kmfl.sourceforge.net/"
license=('GPL')
source=("http://http.debian.net/debian/pool/main/k/kmflcomp/kmflcomp_0.9.8.orig.tar.gz"
        "http://http.debian.net/debian/pool/main/k/kmflcomp/kmflcomp_0.9.8-1.1.diff.gz")
noextract=()
options=()
md5sums=('fba9ee9d332f15aa4c862bbd4ed79f08' '506d930dbe162c662d65ab944fcccd7a')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/${pkgname}_$pkgver-$pkgrel.diff"
}

build() {
	LDFLAGS="-Wl,-O1,--sort-common,-z,relro"
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
