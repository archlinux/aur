# Maintainer: Martin Rys <https://rys.rs/contact>

pkgname=icinga-php-legacy
pkgver=1.1.0
pkgrel=1
pkgdesc="Maintenance-only forks of abandoned upstream packages; for internal Icinga use only"
license=('GPL-3.0-or-later')
arch=('any')
depends=('icingaweb2')
makedepends=('composer')
url="https://github.com/Icinga/icinga-php-legacy"
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/Icinga/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c69e956a24dfa6c7cdee5f6ea275cda993b8c69ac6c1ae0aa866c95ff19edf03')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	composer install --no-dev --no-interaction --no-progress --prefer-dist
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -dm755 "${pkgdir}/usr/share/icinga-php/${pkgname}"
	cp -r gipfl vendor composer.json composer.lock VERSION "${pkgdir}/usr/share/icinga-php/${pkgname}/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
