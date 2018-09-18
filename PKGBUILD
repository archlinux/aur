# Maintainer: Irvine <irvinemcminn_at_that gmail_place>
pkgname=firejail-apparmor
pkgver=0.9.56
pkgrel=3
pkgdesc="Apparmor support for Firejail"
arch=('i686' 'x86_64')
url="https://firejail.wordpress.com/"
license=('GPL2')
depends=('apparmor')
provides=('firejail')
conflicts=('firejail')
backup=('etc/firejail/login.users'
	'etc/firejail/firejail.config'
	'etc/apparmor.d/local/firejail-local')
validpgpkeys=('F951164995F5C4006A73411E2CCB36ADFC5849A7')
#source=(${pkgname}-${pkgver}.tar.gz::https://github.com/netblue30/${pkgname}/archive/$pkgver.tar.gz)
source=(https://sourceforge.net/projects/firejail/files/firejail/firejail-${pkgver}.tar.xz{,.asc})
sha256sums=('41844487c700eeb3ac76235a555ba48dd40b42a1de2892aad329c4901478312d'
            'SKIP')

build() {
	cd "${srcdir}/firejail-${pkgver}"
	# fix build
	export CFLAGS="${CFLAGS/-fsanitize=undefined/}"
	./configure --prefix=/usr --enable-apparmor
	make
}

package() {
	cd "${srcdir}/firejail-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

