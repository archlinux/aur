# Maintainer: ajs124 < aur AT ajs124 DOT de > 

pkgname=firejail
pkgver=0.9.40
pkgrel=1
pkgdesc="Linux namespaces sandbox program"
arch=(i686 x86_64)
license=(GPL2)
url=https://l3net.wordpress.com/projects/firejail/
backup=(etc/firejail/login.users)
#source=(${pkgname}-${pkgver}.tar.gz::https://github.com/netblue30/${pkgname}/archive/$pkgver.tar.gz)
source=(http://sourceforge.net/projects/firejail/files/firejail/firejail-${pkgver}.tar.bz2)
sha512sums=('aef20c5061d5e8e8d064f8cfb807a3b0034f2eb108bde234af56c2d2fd3c06cd7129539db22e142b251c15cbb0b82b89a9acee98ebaa36d3029ffc91c37456fc')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# fix build
	export CFLAGS=${CFLAGS/-fsanitize=undefined/}
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
