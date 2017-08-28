# Maintainer: Irvine <irvinemcminn_at_that gmail_place>
pkgname=firejail-apparmor
pkgver=0.9.50~rc1
pkgrel=1
pkgdesc="Apparmor support for Firejail"
arch=('i686' 'x86_64')
url="https://firejail.wordpress.com/"
license=('GPL2')
depends=('apparmor-profiles' 'apparmor-utils')
provides=('firejail')
conflicts=('firejail')
backup=('etc/firejail/login.users'
	'etc/firejail/firejail.config')
validpgpkeys=('F951164995F5C4006A73411E2CCB36ADFC5849A7')
#source=(${pkgname}-${pkgver}.tar.gz::https://github.com/netblue30/${pkgname}/archive/$pkgver.tar.gz)
source=(https://sourceforge.net/projects/firejail/files/firejail/firejail-${pkgver}.tar.xz{,.asc})
sha256sums=('44e3bf0edd15b2b8b9d406aaaf9ad1746b1316467baa9a9490b494ba11d5c33d'
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

