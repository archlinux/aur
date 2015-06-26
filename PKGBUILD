# Maintainer: Benoit Favre <benoit.favre@gmail.com>

pkgname=opengrm-ngram
pkgver=1.0.3
pkgrel=2
pkgdesc="OpenGrm tool for making n-gram language models as weighted finite-state transducers"
arch=('i686' 'x86_64')
url="http://www.opengrm.org/"
license=('APACHE')
depends=('openfst')
source=("http://openfst.cs.nyu.edu/twiki/pub/GRM/NGramDownload/${pkgname}-${pkgver}.tar.gz"
"ngram-getpid.patch")
md5sums=('03bc3e03b7106b3f135a65838324e7a9'
'bca385009baabb852788baee2d190b46')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

    patch -p1 < ../../ngram-getpid.patch
	./configure --prefix=/usr LDFLAGS=-L/usr/lib/fst
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}
