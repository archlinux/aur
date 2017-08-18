# Maintainer:  Andrew Shelyakov <andrew.shelyakov@ya.ru>

pkgname='php-pecl-pthreads'
# Latest commit working with php 7.1.*
_commit='527286336ffcf5fffb285f1bfeb100bb8bf5ec32'
pkgver=r1334.5272863
pkgrel=2
pkgdesc='PHP PECL extension for Threading API'
arch=('i686' 'x86_64')
url='https://github.com/krakjoe/pthreads'
license=('BSD')
depends=('php-zts')
makedepends=('git')
source=(${pkgname}::"git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"

	phpize
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}"

	make INSTALL_ROOT="${pkgdir}" install
	echo 'extension=pthreads.so' > pthreads.ini

	install -Dm644 "pthreads.ini" "${pkgdir}/etc/php/conf.d/pthreads.ini"
	install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
