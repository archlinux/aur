# Maintainer: Maurycy <10maurycy10@gmail.com>
pkgname=fcron-dev
pkgver=3.3.1
pkgrel=1
pkgdesc='fcron - daemon to execute scheduled task.'
arch=('any')
url='http://fcron.free.fr/'
license=('GPL')
depends=('make' 'gcc')
conflicts=("fcron")
source=("http://fcron.free.fr/archives/fcron-${pkgver}.src.tar.gz")
sha256sums=("f359daa08a63ddfb7fe2f964bb3f5c52244c25aa36f9225a3cc54d36f4681106")

package() {
	cd "${srcdir}/fcron-${pkgver}"
	./configure  --prefix="/usr" --sysconfdir="/etc" --with-systemdsystemunitdir="/etc/systemd/system" --sbindir="/usr/bin" --with-pam=no
	sed -i 's/systemctl daemon-reload//' Makefile
	make -j$(nproc)
	make DESTDIR="${pkgdir}" install
}

