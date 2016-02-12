# Maintainer: Johannes Loher <johannes dot loher at fg4f dot de>

pkgname=codecrypt
pkgver=1.7.3
pkgrel=1
pkgdesc='The post-quantum cryptography tool'
arch=('x86_64' 'i686')
url='http://e-x-a.org/codecrypt/'
license=('LGPL3')
depends=('gmp' 'fftw>=3.0' 'crypto++')
provides=("${pkgname}")
source=("https://github.com/exaexa/codecrypt/archive/v${pkgver}.tar.gz")
md5sums=('4e0c2b959acf0b159d83e4a821e8436f')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./autogen.sh
	./configure LIBS=-lpthread --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
