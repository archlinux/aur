# Maintainer:  Andrew Shelyakov <andrew.shelyakov@ya.ru>

pkgname='php-pecl-pthreads'
pkgver=r1358.5f5fa5b
pkgrel=1
pkgdesc='PHP PECL extension for Threading API'
arch=('i686' 'x86_64')
url='https://github.com/krakjoe/pthreads'
license=('BSD')
depends=('php-zts>=7.2')
makedepends=('git')
source=(${pkgname}::"git+${url}.git")
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
	echo 'extension=pthreads' > pthreads.ini

	install -Dm644 "pthreads.ini" "${pkgdir}/etc/php/conf.d/pthreads.ini"
	install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
