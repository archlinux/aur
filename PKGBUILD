# Maintainer: ajs124 < aur AT ajs124 DOT de > 

pkgname=firetools
pkgver=0.9.30
pkgrel=1
pkgdesc="GUI tools for firejail"
arch=(i686 x86_64)
license=(GPL2)
url=https://l3net.wordpress.com/projects/firejail/#firetools
depends=('firejail' 'qt5-base')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/netblue30/${pkgname}/archive/$pkgver.tar.gz)
sha512sums=('237e1dc0b091874f34a326cca799a9b515861ff8966e319c6b79a6cd717f74d38d39fbd1cbbdaa85563cbfd3eddf61c204d1acf4caf9923c020638080225b199')

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
