# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Oleg Smirnov <oleg.smirnov@gmail.com>

pkgname=pam_pkcs11
pkgver=0.6.8
pkgrel=1
pkgdesc='PAM module allows a X.509 certificate based user login'
arch=('i686' 'x86_64')
url='https://www.opensc-project.org/opensc/wiki/pam_pkcs11'
license=('LGPL')
depends=('pcsclite')
backup=('etc/pam_pkcs11/pam_pkcs11.conf' 'etc/pam_pkcs11/subject_mapping' 'etc/pam_pkcs11/card_eventmgr.conf')
source=("https://www.opensc-project.org/svnp/files/trunk/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('5ca42826b60ffcb574cc16b965f56b00')

build() {
	cd ${pkgname}-$pkgver
	./configure --prefix=/usr \
    --sysconfdir=/etc \
		--with-ldap=no \
    --without-docbook \
    --disable-static
#    --disable-debug # build is broken
  make
}

package() {
	cd ${pkgname}-$pkgver
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}"/etc/pam_pkcs11/{cacerts,crls}
}
