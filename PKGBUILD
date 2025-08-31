# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=libunac
pkgver=1.8.0
pkgrel=3
pkgdesc="A C library removing accents from a string"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/unac/"
license=('GPL2')
source=("http://http.debian.net/debian/pool/main/u/unac/unac_$pkgver.orig.tar.gz"
        "unac-1.8.0-compilation.patch")
sha512sums=('770508daabe7f1cf2fdd2c7cb0f88ed6363a091320547e1f5cafc32db6506c18548be98f6c5780757f3dc914c372a27a336865a0cd92c0a5503245fbb25ca3c8'
            'f10bf207c27b708e61f6f78427d1156e76412d87c0c9fb0cccd3417a7d62d2e35570568a7ca85da57850cc1358d8611162d52e5073cde118aa2900014c056d5e')

prepare() {
  cd "unac-${pkgver}.orig"
  patch -Np1 < "${srcdir}/unac-1.8.0-compilation.patch"
}

build() {
	cd "${srcdir}/unac-${pkgver}.orig"

    touch config.rpath
    ./autogen.sh
    
	./configure \
		--prefix=/usr

	make
}

package(){
	cd "${srcdir}/unac-${pkgver}.orig"

	make DESTDIR="${pkgdir}" install
}
