# Maintainer: Elisamuel Resto <sam@samresto.dev>
# Contributor: Carlos Silva <r3pek@r3pek.org>

pkgname=mod_authnz_pam
pkgver=1.2.3
pkgrel=1
pkgdesc="Apache module to run PAM authorization on result of other module's authentication; also full Basic Auth PAM provider."
arch=('i686' 'x86_64')
license=('apache-2.0')
url="https://www.adelton.com/apache/mod_authnz_pam/"
depends=('apache'
         'pam')
makedepends=('pkgconfig')
source=("https://github.com/adelton/mod_authnz_pam/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('43151a8e1d298729c27742978821cee101c58b15c5880ef54e1982381b6c588f')

build() {
	cd "${pkgname}-${pkgname}-${pkgver}"
	apxs -c mod_authnz_pam.c -lpam -Wall -pedantic
}

package() {
	cd "${pkgname}-${pkgname}-${pkgver}"
	
	APACHE_MOD_DIR=$(apxs -q libexecdir)
	install -D -m755 .libs/mod_authnz_pam.so ${pkgdir}/${APACHE_MOD_DIR}/mod_authnz_pam.so

	APACHE_CONF_DIR=$(apxs -q sysconfdir)
	install -D -m644 authnz_pam.conf ${pkgdir}/${APACHE_CONF_DIR}/extra/authnz_pam.conf
	install -D -m644 authnz_pam.module ${pkgdir}/${APACHE_CONF_DIR}/authnz_pam.conf

	install -D -m644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
