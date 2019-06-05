# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mod_auth_radius
pkgver=1.6.0
pkgrel=1
pkgdesc='Radius authentication module for Apache'
arch=('x86_64' 'i686')
url='http://freeradius.org/mod_auth_radius/'
license=('GPL')
depends=('apache')
conflicts=('apache-mod_auth_radius')
replaces=('apache-mod_auth_radius')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FreeRADIUS/mod_auth_radius/archive/v${pkgver}.tar.gz")
sha256sums=('018a2f9887fb838a256fcc76c37ca996928392e2aaee0a0ef936b6381de60a51')

build() {
	cd "${srcdir}/mod_auth_radius-${pkgver}/"

	apxs -a -c mod_auth_radius.c
}

package() {
	cd "${srcdir}/mod_auth_radius-${pkgver}/"

	# module
	install -D -m0755 .libs/mod_auth_radius.so "${pkgdir}"/usr/lib/httpd/modules/mod_auth_radius.so

	# config

	# doc
	install -D -m0644 htaccess "${pkgdir}"/usr/share/doc/${pkgname}/htaccess
	install -D -m0644 httpd.conf "${pkgdir}"/usr/share/doc/${pkgname}/httpd.conf
	install -D -m0644 index.html "${pkgdir}"/usr/share/doc/${pkgname}/index.html
}

