# Maintainer: Cyrinux <pkgbuilds AT levis DOT name>
# Maintainer: Irvine <irvinemcminn_at_that gmail_place>
pkgname=firejail-apparmor
pkgver=0.9.58.2
pkgrel=2
pkgdesc="Apparmor support for Firejail"
arch=('i686' 'x86_64')
url="https://firejail.wordpress.com/"
license=('GPL2')
depends=('apparmor')
provides=("firejail=$pkgver")
conflicts=('firejail')
backup=('etc/firejail/login.users'
	'etc/firejail/firejail.config'
	'etc/apparmor.d/local/firejail-local')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/netblue30/firejail/archive/$pkgver.tar.gz)
sha256sums=('80a7afb2aa128cbffe537eaa2cad82fe8ecd7879184f5aa0d2ff12268e8edab8')

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
