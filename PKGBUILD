# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=mod_auth_radius
pkgver=1.5.8
pkgrel=1
pkgdesc='Radius authentication module for Apache'
arch=('x86_64' 'i686')
url='http://freeradius.org/mod_auth_radius/'
license=('GPL')
depends=('apache')
conflicts=('apache-mod_auth_radius')
replaces=('apache-mod_auth_radius')
source=('ftp://ftp.freeradius.org/pub/radius/mod_auth_radius-1.5.8.tar'
	'http://ftp.de.debian.org/debian/pool/main/liba/libapache-mod-auth-radius/libapache-mod-auth-radius_1.5.8-1.2.diff.gz')
sha256sums=('6a16cb64c8e3da5ccef5db007d3ab3fa53274bdb37c5f6b1821a12de42aa6d93'
            'e8de2c1a76178dd993d0011966e29c29d1a0ae5db929f6bd643c6fe4d43b6140')

prepare() {
	cd "${srcdir}/mod_auth_radius-${pkgver}/"

	patch -Np1 < "${srcdir}/libapache-mod-auth-radius_1.5.8-1.2.diff"
}

build() {
	cd "${srcdir}/mod_auth_radius-${pkgver}/"

	apxs -c mod_auth_radius-2.0.c
}

package() {
	cd "${srcdir}/mod_auth_radius-${pkgver}/"

	# module
	install -D -m0755 .libs/mod_auth_radius-2.0.so "${pkgdir}"/usr/lib/httpd/modules/mod_auth_radius.so

	# config

	# doc
	install -D -m0644 htaccess "${pkgdir}"/usr/share/doc/${pkgname}/htaccess
	install -D -m0644 httpd.conf "${pkgdir}"/usr/share/doc/${pkgname}/httpd.conf
	install -D -m0644 index.html "${pkgdir}"/usr/share/doc/${pkgname}/index.html
	install -D -m0644 README "${pkgdir}"/usr/share/doc/${pkgname}/README
}

