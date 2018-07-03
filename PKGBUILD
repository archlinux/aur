# Maintainer: François Freitag <mail@franek.fr>
pkgname=php-igbinary
_pkgname=igbinary
pkgver=2.0.7
pkgrel=1
pkgdesc="Igbinary is a drop in replacement for the standard php serializer."
arch=('any')
url='https://github.com/igbinary/igbinary'
license=('BSD')
depends=(php)
conflicts=(php-igbinary-git)
backup=("etc/php/conf.d/igbinary.ini")
source=("${pkgname}-${pkgver}-${pkgrel}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('568d96d6908a24a3ee9a121dba2e785986bcd766bb149343d38d76d3f7209653')

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
