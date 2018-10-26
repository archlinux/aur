# Maintainer: Elisamuel Resto <user00265 at gmail dot com>

_pkgname=phpiredis
pkgname=php-${_pkgname}-git
pkgver=1.0.0.r0.g981d455
pkgrel=1
pkgdesc="PHP extension for Redis based on Hiredis"
arch=("i686" "x86_64")
url="https://github.com/nrk/phpiredis"
license=("PHP")
depends=("php" "hiredis")
source=("git+https://github.com/nrk/phpiredis.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	phpize --clean
	phpize
}

build() {
	cd "${srcdir}/${_pkgname}"
	./configure --prefix=/usr
	make
}

package() {  
	cd "${srcdir}/${_pkgname}"
	make INSTALL_ROOT="${pkgdir}" install
	install -d "${pkgdir}/etc/php/conf.d"
	echo ";extension=${_pkgname}.so" > "$pkgdir/etc/php/conf.d/${_pkgname}.ini"
}
