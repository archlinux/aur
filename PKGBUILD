# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Andreas Radke <andyrtr at archlinux.org>
# Contributor: eric <eric@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=raptor1
pkgver=1.4.21
pkgrel=6
pkgdesc='C library that parses RDF/XML/N-Triples into RDF triples - old V1 api for compatibility'
arch=('x86_64')
url="https://librdf.org/raptor"
depends=('libcurl.so' 'libxslt.so')
license=('LGPL')
provides=("libraptor.so=1-64" "raptor=$pkgver")
options=('!docs')
source=("$pkgname-$pkgver.tar.gz::https://librdf.org/dist/source/raptor-$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::https://librdf.org/dist/source/raptor-$pkgver.tar.gz.asc"
        'curl.patch')
sha256sums=('db3172d6f3c432623ed87d7d609161973d2f7098e3d2233d0702fbcc22cfd8ca'
            'SKIP'
            'b241d4ef063ba24dc69369eb36f1b16c38dd7710c88ccd10bbcb4f2a3eff1245')
validpgpkeys=('F879F0DEDA780198DD08DC6443EC92504F71955A') ## Dave Beckett

prepare() {
	patch -p1 -d "raptor-$pkgver" < curl.patch
}

build() {
	cd "raptor-$pkgver"
	./configure \
		--prefix=/usr \
		--program-suffix=1 \
		--disable-static
	make
}

check() {
	cd "raptor-$pkgver"
	make check
}

package() {
	cd "raptor-$pkgver"
	make install DESTDIR="$pkgdir/"
}
