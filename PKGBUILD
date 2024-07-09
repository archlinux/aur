# Maintainer: Andreas Baumann <mail@andreasbaumann.cc>

pkgname=libunac
pkgver=1.8.0
pkgrel=2
pkgdesc="A C library removing accents from a string"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/unac/"
license=('GPL2')
source=("http://http.debian.net/debian/pool/main/u/unac/unac_$pkgver.orig.tar.gz"
        "unac-1.8.0-compilation.patch")
sha512sums=('770508daabe7f1cf2fdd2c7cb0f88ed6363a091320547e1f5cafc32db6506c18548be98f6c5780757f3dc914c372a27a336865a0cd92c0a5503245fbb25ca3c8'
            '5636a6250cc31daaad2a328004366d9d5ab4a78226e05376f871e7c42c3d2495893f8a7ef71b4e7499eb6498c092168325c4b7c8f9c4c2e75bca68a58720d4ba')

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
