# Maintainer: Benjamin James <benjamin-james@utulsa.edu>

pkgname=gitd
pkgver=0.4.0
pkgrel=1
pkgdesc="A way of notifying you of git commits"
arch=('any')
url="https://github.com/benjamin-james/gitd"
license=('GPL3')
install='gitd.install'
depends=('git' 'glibc')
makedepends=('autoconf')
optdepends=('libnotify: the default notifier for gitd through notify-send')
provides=('gitd')
source=(https://github.com/benjamin-james/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz)
md5sums=('bc8fd8785c73f758b807e0116a586bb6')
build() {
	cd "${pkgname}"
	autoreconf -i
	./configure --prefix=/usr --sysconfdir=/etc/gitd/
	make
}

package() {
	cd "${pkgname}"
	make DESTDIR="${pkgdir}/" install
	install -D -m644 gitd.service "${pkgdir}/usr/lib/systemd/system/gitd.service"
}
