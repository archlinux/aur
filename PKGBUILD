# Maintainer: Boris Momčilović <boris.momcilovic@gmail.com>

_pkgname=phpiredis
pkgname=php-${_pkgname}-git
pkgver=1.0.0.r1.gcc401c1
pkgrel=1
pkgdesc="PHP extension for Redis based on Hiredis"
arch=("i686" "x86_64")
url="https://github.com/gearhead/phpiredis"
license=("PHP")
depends=("php" "hiredis")
source=("git+https://github.com/gearhead/phpiredis.git")
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
