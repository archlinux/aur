# Maintainer: François Freitag <mail@franek.fr>
pkgname=php-igbinary
_pkgname=igbinary
pkgver=2.0.8
pkgrel=1
pkgdesc="Igbinary is a drop in replacement for the standard php serializer."
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/igbinary/igbinary'
license=('BSD')
depends=(php)
conflicts=(php-igbinary-git)
backup=("etc/php/conf.d/igbinary.ini")
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('96d2ff56db2b307b03f848028decb780cb2ae7c75fa922871f5f3063c7a66cb2')

build() {
	cd "${_pkgname}-${pkgver}"

	phpize
	./configure --enable-igbinary
	make
}

check() {
	cd "${_pkgname}-${pkgver}"

	NO_INTERACTION=1 make test
}

package() {
	cd "${_pkgname}-${pkgver}"

	make INSTALL_ROOT="$pkgdir" install
	install -D -m0644 \
		"${srcdir}/${_pkgname}-${pkgver}/igbinary.php.ini" \
		"${pkgdir}/etc/php/conf.d/igbinary.ini"
	install -D -m0644 \
		"${srcdir}/${_pkgname}-${pkgver}/COPYING" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
