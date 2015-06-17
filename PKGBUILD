# Maintainer: Benjamin James <benjamin-james@utulsa.edu>

pkgname=gitd
pkgver=0.2.0
pkgrel=1
pkgdesc="A way of notifying you of git commits"
arch=('any')
url="https://github.com/benjamin-james/gitd"
license=('GPL3')
depends=('git' 'glibc')
makedepends=('autoconf')
optdepends=('libnotify: the default notifier for gitd through notify-send')
provides=('gitd')
source=(https://github.com/benjamin-james/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz)
md5sums=('2cbd1094d858658ddef3ddba312101c3')
build() {
	cd "${pkgname}"
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}/" install
	install -D -m644 gitd.service "${pkgdir}/usr/lib/systemd/system/gitd.service"
}
