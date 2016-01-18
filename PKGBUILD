# Maintainer: Johannes Loher <johannes dot loher at fg4f dot de>

pkgname=codecrypt
pkgver=1.7.1
pkgrel=1
pkgdesc='The post-quantum cryptography tool'
arch=('x86_64' 'i686')
url='http://e-x-a.org/codecrypt/'
license=('LGPL3')
depends=('gmp' 'fftw>=3.0' 'crypto++')
provides=("${pkgname}")
source=('https://github.com/exaexa/codecrypt/archive/v1.7.1.tar.gz'
        'crypto++_headers.patch')
md5sums=('879c2a75dea2d70fb895a15edd51d896'
         '4aa83a903edaba67a6334b8aec2ebc0c')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	patch -p1 < "${srcdir}/crypto++_headers.patch"
}

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
