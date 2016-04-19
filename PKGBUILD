# Maintainer: Johannes Loher <johannes dot loher at fg4f dot de>

pkgname=codecrypt
pkgver=1.7.4
pkgrel=1
pkgdesc='The post-quantum cryptography tool'
arch=('x86_64' 'i686')
url='http://e-x-a.org/codecrypt/'
license=('LGPL3')
depends=('gmp' 'fftw>=3.0' 'crypto++')
provides=("${pkgname}")
source=("https://github.com/exaexa/codecrypt/archive/v${pkgver}.tar.gz")
md5sums=('df725f95d1d663c7c581797738c029e8')

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
